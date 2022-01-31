# aws-terafrom-script

This is a script for create EC2 instance in the AWS Cloud

[AWS provider - manual](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
[Terraform cloud](https://app.terraform.io/)

## Variables

| variable       | type   | defaullt  | required | description          |
| -------------- | ------ | --------- | -------- | -------------------- |
| project_name   | string | "project" | no       | The project name     |
| environment    | string | "test"    | no       | The name environment |
| aws_region     | string | ""        | yes      | The AWS region                     |
| aws_access_key | string | ""        | yes      | AWS access key       |
| aws_secret_key | string | ""        | yes      | AWS secret key       |
| aws_key_pair   | string | ""        | yes      | SSH public key                     |
| cidr_network| map | { "dev"   = "10.20" "prod"  = "10.30" }|Options to create VPC|
| your_first_name | string | ""| yes| Your first name|
| your_last_name| string| ""| yes| Your last name|
| ip_access_list| list | [] | yes | IP whitelist|


## Configuration
