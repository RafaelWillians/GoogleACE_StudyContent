# Virtual Private Cloud - VPC

## Informações importantes

Há 2 tipos de redes criadas no Google Cloud: Auto Mode e Custom Mode 
As VPCs Auto Mode são as criadas automaticamente pelo Google Cloud. São criadas com IPs específicos para cada região e com bloco CIDR /20. 

Para excluir uma VPC, caso tenha recursos nela, é necessário excluir primeiro os recursos para então poder excluir a VPC.

## Comandos CLI

Expandir o range de IPs da subrede.
```
gcloud compute networks subnets expand-ip-range nome-subrede --region=nome-regiao --prefix-length=16
```

Ver informações da subrede.
```
gcloud compute networks subnets describe nome-subrede --region=nome-regiao
```





