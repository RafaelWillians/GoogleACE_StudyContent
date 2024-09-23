# Use the official image as a parent image
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu

# Atualiza o sistema de pacotes
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    ca-certificates \
    apt-transport-https

# Adiciona o repositório do Google Cloud SDK
RUN echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

# Atualiza o sistema de pacotes e instala o Google Cloud SDK
RUN apt-get update && apt-get install -y google-cloud-sdk

# Inicializa o gcloud
RUN gcloud init

# Copia seu arquivo de configuração (opcional)
COPY gcloud.json /root/.config/gcloud/

# Define o usuário padrão
USER nonroot

# Comando padrão para executar ao iniciar o container
CMD ["bash"]