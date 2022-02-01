# aws-terafrom-script

This is a script for create EC2 instance in the AWS Cloud

[AWS provider - manual](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
[Terraform cloud](https://app.terraform.io/)

## Start

1. Generate ssh key 

```bash   
ssh-keygen -t rsa -b 4096 -C <your_email> -f <path_fo_folder>/<file_name_for_key> -N ''
```

2. Generate file with configuration for web service, { For UNIX system you can use: *make config* or create file *terraform.auto.tfvars* from example *terraform.auto.tfvars.example*
3. Create web service usage *make apply*. 
4. For more detaile please use *make* or *make help*


## Generate report
 
1. Gererate output file use *make output* or *terraform output -json > ./infrastructure.json*
2. ```cd analitics```
3. ```pip3 install --upgrade pip```
4. ```pip3 install --no-cache-dir -r requirements.txt```
5. Create .env from example (``` cp .env.example .env ```) and configuration *.env* file
6. Start *./main.py* script checking result and generate report.

## Variables

| variable       | type   | defaullt  | required | description          |
| -------------- | ------ | --------- | -------- | -------------------- |
| project_name   | string | "project" | no       | The project name     |
| environment    | string | "dev"     | no       | The name environment |
| aws_region     | string | ""        | yes      | The AWS region                     |
| aws_access_key | string | ""        | yes      | AWS access key       |
| aws_secret_key | string | ""        | yes      | AWS secret key       |
| aws_key_pair   | string | ""        | yes      | SSH public key                     |
| cidr_network| map | { "dev"   = "10.20" "prod"  = "10.30" }| no | Parameters for create VPC |
| your_first_name | string | ""| yes| Your first name|
| your_last_name| string| ""| yes| Your last name|
| ip_access_list| list | [] | yes | IP whitelist|

