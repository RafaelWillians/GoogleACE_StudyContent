#!/usr/bin/env bash

# Script para criar alerta de orçamento,
# quando o gasto ultrapassar determinado valor passado por parâmetro
# pelo usuário.

# Por padrão este script irá checar a billing account (conta de faturamento)
# padrão e utilizá-la para criar o alerta

# Checa a billing account padrão criada e atribui à variável BILLING_ACCOUNT
BILLING_ACCOUNT=$(gcloud billing accounts list --format='value(name)')

# Checa o projeto padrão configurado
DEFAULT_PROJECT=$(gcloud config get-value project)

# Caso esteja vazio, atribui o primeiro projeto listado
if [[ -z "$DEFAULT_PROJECT" ]]; then
  DEFAULT_PROJECT=$(gcloud projects list --format="value(projectId)" --limit=1)
fi

# Faz a leitura do nome do orçamento
read -p "Budget Name: " DISPLAY_NAME

# Faz a leitura do limite desejado
read -p "Insert one budget ammount in default currency(ex. 0.50 or 123.75): " \
  BUDGET_AMMOUNT

# Faz a leitura do percentual de limite (threshold)

read -p "Insert one threshold value percent(ex. '0.50' for a 50% threshold): " \
  THRESHOLD_PERCENT

# Faz a leitura do tipo de base de cálculo (basis), se atualmente gasta ou prevista
read -p "Insert '1' for current-spend basis or '2' for forecasted-spend basis: " \
  THRESHOLD_BASIS

# Faz a leitura do email a ser adicionado para alerta
read -p "Email for alerts: " \
  ALERT_EMAIL

# Faz a leitura do nome do canal de notificação
read -p "Monitoring channel display name: " \
  CHANNEL_DISPLAY_NAME

# Faz a leitura da descrição do canal de notificação
read -p "Channel Description: " \
  CHANNEL_DESCRIPTION

# Teste: saída dos argumentos para checar os valores

echo "$BUDGET_AMMOUNT , $THRESHOLD_PERCENT , $THRESHOLD_BASIS , $ALERT_EMAIL , $CHANNEL_DISPLAY_NAME, $CHANNEL_DESCRIPTION, $DISPLAY_NAME"

# Verifica se foram passados os valores como argumento. 
if [[ -z "$ALERT_EMAIL" ]] || \
  [[ -z "$DISPLAY_NAME" ]] || \
  [[ -z "$BUDGET_AMMOUNT" ]] || \
  [[ -z "$THRESHOLD_PERCENT" ]] || \
  [[ -z "$THRESHOLD_BASIS" ]] || \
  [[ -z "$CHANNEL_DISPLAY_NAME" ]] || \
  [[ -z "$CHANNEL_DESCRIPTION" ]]; then
  echo "Not enough arguments provided."
  exit 1
fi

# Checa se o tipo de base de cálculo recebeu valor correto
# e atribui de acordo com o input do usuário
if [[ "$THRESHOLD_BASIS" != "1" && "$THRESHOLD_BASIS" != "2" ]]; then
  echo "Invalid argument for spend basis."
  exit 1
fi

if [[ "$THRESHOLD_BASIS" == "1" ]]; then
  THRESHOLD_BASIS="current-spend"  
fi

if [[ "$THRESHOLD_BASIS" == "2" ]]; then
  THRESHOLD_BASIS="forecasted-spend"  
fi

# Cria o canal de notificação com o email inserido
gcloud beta monitoring channels create \
  --display-name=$CHANNEL_DISPLAY_NAME \
  --description=$CHANNEL_DESCRIPTION \
  --type=email \
  --channel-labels=email_address=$ALERT_EMAIL

# Atribui o ID do canal de notificação
# NOTIFICATION_CHANNEL_ID=$(gcloud beta monitoring channels list | grep "$CHANNEL_DISPLAY_NAME" | awk '{print $1}')
NOTIFICATION_CHANNEL_ID=$(gcloud beta monitoring channels list --format=json | jq '.[] | select(.displayName == "'"$CHANNEL_DISPLAY_NAME"'") | .name' | sed 's/"//g')

 # Cria o orçamento
  gcloud beta billing budgets create \
    --billing-account=$BILLING_ACCOUNT \
    --display-name=$DISPLAY_NAME \
    --budget-amount=$BUDGET_AMMOUNT \
    --all-updates-rule-monitoring-notification-channels=$NOTIFICATION_CHANNEL_ID \
    --ownership-scope=all-users \
    --threshold-rule=percent=$THRESHOLD_PERCENT,basis=$THRESHOLD_BASIS \
    --threshold-rule=percent=1,basis=$THRESHOLD_BASIS \
    --calendar-period=month \
