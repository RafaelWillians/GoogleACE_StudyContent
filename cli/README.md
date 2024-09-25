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

Lista informações sobre o SDK
```
gcloud info
```
