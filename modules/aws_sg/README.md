# AWS create security groups

## inputs

| variable     | type      | default | description                        |
| ------------ | --------- | ------- | ---------------------------------- |
| name         | string    | ""      | Prefix name for security group     |
| vpc_id       | string    | ""      | The VPC ID                         |
| ingress_data | map(list) | ""      | List open ports for web permission |


## outputs

| variable | type   | description                 |
| -------- | ------ | --------------------------- |
| sg_id    | string | The security group ID       |
| sg_name  | string | Name created security group |

## usage

```terraform
module sg_app {
  source       = "./modules/aws_sg"
  name         = "${local.prefix}-app"
  vpc_id       = module.vpc.vpc_id
  ingress_data = local.permission_app
}
```
