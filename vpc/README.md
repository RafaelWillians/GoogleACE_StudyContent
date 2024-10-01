# Virtual Private Cloud - VPC

## Informações importantes

Há 2 tipos de redes criadas no Google Cloud: Auto Mode e Custom Mode 
As VPCs Auto Mode são as criadas automaticamente pelo Google Cloud. São criadas com IPs específicos para cada região e com bloco CIDR /20. 
As VPCs Custom Mode permitem criar as subredes da forma que desejar.

Para excluir uma VPC, caso tenha recursos nela, é necessário excluir primeiro os recursos para então poder excluir a VPC.

É possível expandir um range de IP de uma VPC. Limite máximo de range de IP é /16.
Após expandir, não é possível desfazer.

Subredes não podem se sobrepor no range de IP. 

IP's reservados

Primeiro endereço (exemplo: 172.0.0.0/20): para a rede
Segundo endereço (exemplo: 172.0.0.1/20): gateway padrão
Penúltimo endereço (exemplo: 172.0.0.254/20): para uso futuro do Google Cloud
Último endereço (exemplo: 172.0.0.255/20): broadcast

## Comandos CLI

Expandir o range de IPs da subrede.
```
gcloud compute networks subnets expand-ip-range nome-subrede --region=nome-regiao --prefix-length=16
```

Ver informações da subrede.
```
gcloud compute networks subnets describe nome-subrede --region=nome-regiao
```





