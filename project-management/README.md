# Gerenciamento de Projetos

Projetos servem para ramificar as implementações, departamentos e/ou projetos criados no Google Cloud.
Ao criar, o nome do projeto não precisa ser único. Porém o ID de projeto (e o número de projeto - que é gerado automaticamente) necessita ser único em todo Google Cloud.

## Comandos

Criar um projeto.
```
gcloud projects create exemplo-nome-projeto-1234
```

Criar um projeto a um ID de organização específico
```
gcloud projects create exemplo-nome-projeto-1234 --organization=id_organization
```

Criar um projeto a um ID de diretório específico
```
gcloud projects create exemplo-nome-projeto-1234 --folder=id_folder
```

Listar os projetos
```
gcloud projects list
```

Ver detalhes de projeto específico
```
gcloud projects describe exemplo-nome-projeto-1234
```

Excluir projeto.
```
gcloud projects delete exemplo-nome-projeto-1234
```

Restaurar projeto excluído (até 30 dias para recuperar após exclusão)
```
gcloud projects undelete exemplo-nome-projeto-1234
```