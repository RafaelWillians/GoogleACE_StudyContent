# Gerenciamento de Projetos

Projetos servem para ramificar as implementações, departamentos e/ou projetos criados no Google Cloud.
Ao criar, o nome do projeto não precisa ser único. Porém o ID de projeto (e o número de projeto - que é gerado automaticamente) necessita ser único em todo Google Cloud.

## Cenário de projeto não encontrado por conta raíz - contas de faturamento

No Google Cloud, você pode trabalhar com a hierarquia de ter uma organização e nela vários projetos e contas diferentes atreladas a cada projeto.
Ocorreu um cenário em que em uma conta de faturamento, foram criados 2 projetos e uma conta diferente como Owner para cada projeto.

![projetos.png](/project-management/pics/projetos.png)

Utilizando a conta raíz, que é a conta de faturamento e que iniciou o uso da nuvem, abrimos o Menu > IAM > Manage Resources para mostrar a tela com os projetos. Porém consta apenas 1 projeto!

Como resolver isso?

Isso ocorre devido ao segundo projeto ter sido criado à conta de faturamento, porém a conta raíz que usamos para consultar não possui permissão para acessá-lo.

Acesse o Menu > Billing > opção Manage Billing Account.
Lá terão os projetos do lado esquerdo e quais contas estão como Billing Account Administrator ou Billing Account User.

![account-management.png](/project-management/pics/account-management.png)

Caso precise que a conta raíz acesse este outro projeto, acesse o Google Cloud com a conta secundária para então liberar as permissões desejadas à conta raíz.

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