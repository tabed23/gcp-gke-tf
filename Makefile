start:
	terraform init

plan:
	terraform plan -var-file="tfvars/terraform.tfvars" 
migrate:
	terraform init -migrate-state


delete:
	terraform destroy -var-file="tfvars/terraform.tfvars" --auto-approve
unlock:
	terraform force-unlock -force
fmt:
	terraform fmt -recursive