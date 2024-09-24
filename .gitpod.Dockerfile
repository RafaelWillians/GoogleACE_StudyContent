# Usa a mesma imagem base usada no devcontainer
FROM mcr.microsoft.com/vscode/devcontainers/base:debian

# Instalar dependências necessárias para o Google Cloud SDK
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    gnupg \
    curl \
    lsb-release

# Adicionar a chave GPG do Google Cloud SDK
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
    && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Instalar o Google Cloud SDK sem interação
RUN apt-get update && apt-get install -y google-cloud-sdk

# Desativar prompts interativos do gcloud durante a build
ENV CLOUDSDK_CORE_DISABLE_PROMPTS=1

# Limpar cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
