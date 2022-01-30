.PHONY: help

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