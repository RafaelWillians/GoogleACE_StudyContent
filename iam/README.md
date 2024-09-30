# IAM - Identity and Access Management

## Boas Práticas

### Privilégio mínimo
* Fornecer apenas o acesso mínimo necessário.
* Usar roles pré-definidas em vez de roles primitivas.
* Conceder roles no menor escopo possível.
* Recursos herdados não podem restringir acessos concedidos aos recursos primários.
* Restringir quam pode criar e gerenciar contas de serviço.
* Cautela com as roles Owner.

### Hierarquia dos Recursos
* Espelhar a hierarquia nos recursos do Google Cloud com a hierarquia na organização.
* Usar projetos para agrupar os recursos com o mesmo escopo de confiança.
* Atribuir políticas no nível de organização e no nível de projeto em vez de abribuir no nível de recurso.
* Seguir o princípio de privilégio mínimo para atribuir roles IAM.
* Atribuir roles para usuários ou grupos no nível de diretório em vez de atribuir no nível de projeto, se envolver múltiplos projetos.

### Contas de serviço
* Cada app usar uma conta de serviço diferente, de acordo com o escopo de confiança.
* Não excluir contas de serviço que estejam em execução.
* Rotacionar chaves de contas de serviço gerenciadas por usuários.
* Nomear chaves de acordo com o uso e permissões concedidas.
* Restringir acesso das contas de serviço.
* Não checar o código fonte das chaves, nem deixar as chaves armazenadas no computador.

### Auditoria
* Checar regularmente os Cloud Audit Logs para auditar as mudanças nas políticas do IAM.
* Auditar quem pode editar as políticas IAM nos projetos.
* Exportar os logs de auditoria no Cloud Storage para armazenamento de longo prazo.* (ATENÇÃO! Caso utilize Google Cloud apenas para uso pessoal, isso resulta em custos de armazenamento. Porém para empresas, por regulamentos e leis, pode ser necessário mesmo assim armazenar os logs.)
* Auditar regularmente as chaves das contas de serviço.
* Restringir acesso aos logs.

### Gerenciamento de políticas
* Use política no nível de organização, caso necessite conceder acesso a todos os projetos na organização.
* Sempre que possível, atribuir roles a um Google Group em vez de usuários individualmente.
* Quando necessitar liberar várias roles para um trabalho específico, em vez disso crie um Google Group.


