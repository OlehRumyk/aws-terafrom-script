# AWS VPC

## inputs

| variable     | type   | Default | Required | description  |
| ------------ | ------ | ------- | -------- | ------------ |
| name         | string | ""      | yes      | Name         |
| environment  | string | ""      | yes      | Environment  |
| cidr_network | string | ""      | yes      | CIDR network |

## outputs

| variable          | type         | description             |
| ----------------- | ------------ | ----------------------- |
| vpc_id            | string       | ID private VPC          |
| subnet_id         | list(string) | List subnets id         |
| subnet_arn        | list(string) | List subnets arn        |
| owner_id          | list(string) | ID owner list subnets   |
| subnet_cidr_block | list(string) | List subnets cidr block |

## usage

```terraform
module vpc {
  source       = "./modules/aws_vpc"
  name         = local.prefix
  environment  = var.environment
  cidr_network = lookup(var.cidr_network, var.environment)
}
```
