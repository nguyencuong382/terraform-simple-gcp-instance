#!/bin/sh

# SSH_FILE=azurebstn.pub
SSH_FILE=azure_vhcm_train_service.pub
# ENV_AUTH=nc_edu.env
# ENV_AUTH=hieuhm_edu.env
# ENV_AUTH=thanhpb.env
ENV_AUTH=phai_edu.env

if [ $# -eq 0 ]
then
  echo "No action input"
else
  echo "Setting environment variables for Terraform"
  export $(egrep -v '^#' ./auth/${ENV_AUTH} | xargs)
  terraform $1 \
  -var public_key="$(cat ~/.ssh/${SSH_FILE})" \
  -var instance_type="Standard_B2s" \
  -var resource_prefix="vhcm-train"
fi
# terraform plan -var public_key="$(cat ~/.ssh/azurebstn.pub)"
# terraform apply -var public_key="$(cat ~/.ssh/azurebstn.pub)"
# terraform import azurerm_resource_group.rg /subscriptions/22c98b98-6245-43cf-a9f5-aa411207dd0c/resourceGroups/CI
# terraform destroy