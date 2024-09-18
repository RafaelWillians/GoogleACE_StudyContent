#!/usr/bin/env bash

# Script para criar alerta de orçamento,
# quando o gasto ultrapassar determinado valor passado por parâmetro
# pelo usuário 

# Por padrão este script irá checar a billing account (conta de faturamento)
# padrão e utilizá-la para criar o alerta

# Checa a billing account padrão criada e atribui à variável BILLING_ACCOUNT

BILLING_ACCOUNT=$(gcloud billing accounts list --format='value(name)')










