#!/usr/bin/env bash

# Script para criar alerta de orçamento,
# quando o gasto ultrapassar determinado valor passado por parâmetro
# pelo usuário 

# Por padrão este script irá checar a billing account (conta de faturamento)
# padrão e utilizá-la para criar o alerta

# Checa a billing account padrão criada e atribui à variável BILLING_ACCOUNT
BILLING_ACCOUNT=$(gcloud billing accounts list --format='value(name)')

# Faz a leitura do nome do orçamento
read -p "Budget Name: " DISPLAY_NAME

# Faz a leitura do limite desejado
read -p "Insert one budget ammount in default currency(ex. 0.50 or 123.75): " \
  BUDGET_AMMOUNT

# Faz a leitura do percentual de limite (threshold)

read -p "Insert one threshold value percent(ex. '0.50' for a 50% threshold): " \
  THRESHOLD_PERCENT

# Faz a leitura do tipo de base de cálculo (basis), se atualmente gasta ou prevista
read -p "Insert 'c' for current-spend basis or 'p' for forecasted-spend basis: " \
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

# Verifica se foram passados os valores como argumento. 
if [[ -z "$ALERT_EMAIL" || -z "$BUDGET_AMMOUNT" || -z "$THRESHOLD_PERCENT" ]]; then
  echo "Not enough arguments provided."
  exit 1
fi

# Cria o canal de notificação com o email inserido
gcloud beta monitoring channels create \
  --display-name=$CHANNEL_DISPLAY_NAME \
  --description=$CHANNEL_DESCRIPTION \
  --type=email \
  --channel-labels=email_address=$ALERT_EMAIL










