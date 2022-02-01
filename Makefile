.PHONY: help

SHELL := /bin/bash
MAKEFILE_PATH := ./Makefile

help:  ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n\nOptions:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)
	${info }
	$(info ********** Read the instructions before use **********)

init: ## Use for initialization terraform script
	$(info ********** Proccess up initialization terraform script has begun **********)
	@terraform init

reinit: ## Use for re-initialization terraform script
	$(info ********** Proccess up re-initialization terraform script has begun **********)
	@terraform init -reconfigure

check: ## Use for validation terraform script
	$(info ********** Proccess up validate terraform script has begun **********)
	@terraform validate

config: ## Use for create configuration file
	$(info ********** Proccess generate configuration file has begun **********)
	@if [ -a ./terraform.auto.tfvars ]; then cp ./terraform.auto.tfvars ./terraform.auto.tfvars_$$(date '+%Y_%m_%d_%H_%M_%S'); fi;
	@read -p 'Project name: ' PROJECT && echo "project_name = \"$${PROJECT}\"" > ./terraform.auto.tfvars
	@read -p 'Environment: ' ENVIRONMENT && echo "environment = \"$${ENVIRONMENT}\"" >> ./terraform.auto.tfvars
	@read -p 'The AWS region: ' AWS_REGION && echo "aws_region = \"$${AWS_REGION}\"" >> ./terraform.auto.tfvars
	@read -p 'Your first name: ' YOUR_FIRST_NAME && echo "your_first_name = \"$${YOUR_FIRST_NAME}\"" >> ./terraform.auto.tfvars
	@read -p 'Your last name: ' YOUR_LAST_NAME && echo "your_last_name = \"$${YOUR_LAST_NAME}\"" >> ./terraform.auto.tfvars
	@read -p 'AWS access key: ' AWS_ACCESS_KEY && echo "aws_access_key = \"$${AWS_ACCESS_KEY}\"" >> ./terraform.auto.tfvars
	@read -p 'AWS secret key: ' AWS_SECRET_KEY && echo "aws_secret_key = \"$${AWS_SECRET_KEY}\"" >> ./terraform.auto.tfvars
	@read -p 'SSH public key: ' AWS_KEY_PAIR && echo "aws_key_pair = \"$${AWS_KEY_PAIR}\"" >> ./terraform.auto.tfvars
	@read -p 'IP access list. For example: [ "xxx.xxx.xxx.xxxx/32", "xxx.xxx.xxx.xxxx/32" ]: ' IP_ACCESS_LIST && echo "ip_access_list = $${IP_ACCESS_LIST}" >> ./terraform.auto.tfvars

plan: ## Use for view plan terrarorn script
	$(info ********** Proccess view plan has begun **********)
	@terraform init
	@terraform plan

apply: ## Use for start terrafrom script for create or change infrastructure
	$(info ************************************************************************************************)
	$(info ********** Proccess up terraform sctipt for create or change infrastructure has begun **********)
	$(info ************************************************************************************************)
	@terraform init
	@terraform apply -auto-approve

delete: ## Use for start terrafrom script for delete infrastructure
	$(info ************************************************************************************************)
	$(info ********** Proccess up terraform sctipt for delete or change infrastructure has begun **********)
	$(info ************************************************************************************************)
	@terraform destroy

output: ## Use for save terraform output to file
	@terraform output -json > ./infrastructure.json