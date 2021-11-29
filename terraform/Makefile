## init: Run terraform init command
.PHONY: init
init: check-env
	@terraform init 

## plan: Run terraform plan command
.PHONY: plan
plan: check-env
	@terraform fmt && \
	terraform validate && \
	terraform plan \
	-out=terraform.plan 

## apply: Run terraform apply command
.PHONY: apply
apply: check-env
	@terraform apply terraform.plan 

## destroy: Run terraform destroy command
.PHONY: destroy
destroy: check-env
	@terraform destroy 

## output
.PHONY: output
output: check-env
	@terraform output -raw kubeconfig > ../secrets/kubeconfig

check-env:
ifndef DIGITALOCEAN_TOKEN
	$(error DIGITALOCEAN_TOKEN is undefined)
endif
