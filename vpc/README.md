# Virtual Private Cloud - VPC

## Informações importantes

Há 2 tipos de redes criadas no Google Cloud: Auto Mode e Custom Mode 
As VPCs Auto Mode são as criadas automaticamente pelo Google Cloud. São criadas com IPs específicos para cada região e com bloco CIDR /20. 
As VPCs Custom Mode permitem criar as subredes da forma que desejar.

Para excluir uma VPC, caso tenha recursos nela, é necessário excluir primeiro os recursos para então poder excluir a VPC.

É possível expandir um range de IP de uma VPC. Limite máximo de range de IP é /16.
Após expandir, não é possível desfazer.

Subredes não podem se sobrepor no range de IP.

IP's reservados precisam ser explicitamente removidos caso não desejar mais usar. Excluir instância que utiliza IP reservado não exclui esta reserva. 

#### IP's reservados

| Endereços   | Exemplo   | Função   |
|------------|------------|------------|
| Primeiro endereço | 172.0.0.0/20 | Determinar a rede |
| Segundo endereço | 172.0.0.1/20 | Gateway padrão |
| Penúltimo endereço | 172.0.0.254/20 | para uso futuro do Google Cloud |
| Último endereço | 172.0.0.255/20 | Broadcast |

## Comandos CLI

Expandir o range de IPs da subrede.
```
gcloud compute networks subnets expand-ip-range nome-subrede --region=nome-regiao --prefix-length=16
```

Ver informações da subrede.
```
gcloud compute networks subnets describe nome-subrede --region=nome-regiao
```

Reservar endereço IP Regional
```
gcloud compute addresses create nome-reserva --region nome-regiao
```

Reservar IP Global
```
gcloud compute addresses create nome-reserva --global --ip-version [ipv4 | ipv6]
```
Listar os IP's reservados (internos e externos)
```
gcloud compute addresses list
```

Promover IP externo efêmero para estático
```
gcloud compute addresses create promoted-external --addresses ip-externo --region nome-regiao
```

Excluir IP's internos promovidos a estáticos
```
gcloud compute addresses delete promoted-static --region nome-regiao
```

Excluir IP's internos estáticos
```
gcloud compute addresses delete static-internal --region nome-regiao
```

Criar VPC Custom com subrede pública e privada
```
gcloud compute networks create custom \
 --project=nome-projeto --description=descricao \
 vpc\ network \
 --subnet-mode=custom \ 
 --bgp-routing-mode=regional

gcloud compute networks subnets create public \
 --project=nome-projeto \
 --range=ip-range \
 --network=nome-rede \
 --region=nome-regiao

gcloud compute networks subnets create private \
 --project=nome-projeto \
 --range=ip-range \
 --network=nome-rede \
 --region=nome-regiao
```

