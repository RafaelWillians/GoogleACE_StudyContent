# CLI - Comandos Básicos

Autenticar conta - configuração inicial
Para poder selecionar a região, antes ative o [Compute Engine API](https://console.cloud.google.com/apis/library/compute.googleapis.com) na conta desejada.

```
gcloud init
```

Mostra a lista de contas autenticadas
```
gcloud auth list
```

Selecionar a conta a ser usada
```
gcloud config set account email@example.com
```

Revogar credencial
```
gcloud auth revoke email@example.com
```

Lista todas as informações sobre o SDK
```
gcloud info
```

Os comandos abaixo vão permitir criar ou selecionar configurações específicas.
Estas configurações são os perfis dentro do SDK. Servem por exemplo para termos um perfil para cada usuário, ou para cada projeto. Podemos ter mais de uma configuração no SDK, mas somente pode ter uma conta ativa por configuração.

Lista as informações da configuração ativa no momento.
```
gcloud config list
```

Lista as configurações disponíveis.
```
gcloud config configurations list
```

Seleciona a configuração desejada.
```
gcloud config configurations activate config-name
```

Criar configuração.
```
gcloud config configurations create config-name
```

Listar propriedades de configuração específica.
```
gcloud config configurations describe config-name
```

Selecionar projeto específico.
```
gcloud config set project name-project
```

Mostrar a região ativa.
```
gcloud config get compute/zone
```

Selecionar a zona. Neste exemplo, irá mudar para a região us-east1 .
```
gcloud config set compute/zone us-east1
```

Instalar o componente para executar comandos beta do gcloud.
```
gcloud components install beta
```

Executar o Gcloud Interactive Shell (requer componente beta).
Permite executar os comandos via CLI de forma mais intuitiva.
```
gcloud beta interative
```

Atribui como projeto padrão o primeiro projeto da lista de projetos atribuídos à conta conectada.
Útil caso a conta esteja em um único projeto, irá atribuir sempre o mesmo.

```
gcloud config set project $(gcloud projects list --format="value(projectId)" --limit=1)
```

## Cloud Shell

Identificar qual região a VM do Cloud Shell está em execução. 
```
curl metadata/computeMetadata/v1/instance/zone
```

Configurar para sempre que iniciar o Cloud Shell, atribuir como padrão o primeiro projeto listado na conta ou o único projeto que tem na conta:

* Executar o comando abaixo.
```
edit ~/.bashrc
```

* Depois, no final do arquivo adicionar o comando abaixo.
```
gcloud config set project $(gcloud projects list --format="value(projectId)" --limit=1)
```

* Salvar o arquivo.

* Depois, executar o comando abaixo e testar.
```
source ~/.bashrc
```

## IAM

Mostrar a política IAM (em JSON ou YAML) de um projeto.
```
gcloud projects get-iam-policy nome-projeto-1234
```

Mostrar a política IAM de um diretório (folder).
```
gcloud resource-manager folders get-iam-policy id-folder
```

Mostrar a política IAM de uma organização.
```
gcloud organizations get-iam-policy id-organization
```

Atribui uma política em YAML ao projeto. Requer 7 minutos para replicar a alteração no Google Cloud.
```
gcloud projects set-iam-policy nome-projeto-1234 policy.yaml
```

