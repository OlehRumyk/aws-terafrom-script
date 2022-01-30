# aws-terafrom-script

This is a script for create EC2 instance in the AWS Cloud

## Variables

| variable       | type   | defaullt  | required | description          |
| -------------- | ------ | --------- | -------- | -------------------- |
| project_name   | string | "project" | no       | The project name     |
| environment    | string | "test"    | no       | The name environment |
| aws_region     | string | ""        | yes      |                      |
| aws_access_key | string | ""        | yes      | AWS access key       |
| aws_secret_key | string | ""        | yes      | AWS secret key       |
| aws_key_pair   | string | ""        | yes      |                      |


## Configuration

```bash
ssh-keygen -t rsa -b 4096 -C <email> -f ./<file_name_for_key> -N ''
```
