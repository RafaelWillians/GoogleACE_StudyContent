#!/usr/bin/env bash

# Script para criar alerta de orçamento,
# quando o gasto ultrapassar determinado valor passado por parâmetro
# pelo usuário 

# Por padrão este script irá checar a billing account (conta de faturamento)
# padrão e utilizá-la para criar o alerta

# Checa a billing account padrão criada e atribui à variável BILLING_ACCOUNT
BILLING_ACCOUNT=$(gcloud billing accounts list --format='value(name)')

# Atribui à variável os limites(threshold) que o usuário inserir como parâmetro
BUDGET_THRESHOLD=$1

# Verifica se foram passados os limites como argumento. 
if [ -z "$1" ]; then
  echo "Budget threshold not provided."
  exit 1
fi

 # Cria o orçamento
gcloud billing budgets create MyBudgetAlert \
  --billing-account $BILLING_ACCOUNT \
  --threshold 100 \
  --threshold-unit USD \
  --alert-metadata email \
  --alert-metadata-email $USER_EMAIL









