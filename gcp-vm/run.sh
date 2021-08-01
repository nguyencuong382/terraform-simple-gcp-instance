#!/bin/sh

# PROJECT=aiguaigu
PROJECT=kubernetestestdeploy

if [ $# -eq 0 ]
then
  echo "No action input"
else
  echo "Setting environment variables for Terraform"
  export $(egrep -v '^#' ./auth/$PROJECT.env | xargs)

  terraform $1 \
  -var credentials="$(cat $GOOGLE_AUTHEN_JSON)" \
  -var private_key="$(cat $PRIVATE_KEY)" \
  -var public_key="$(cat $(echo $PUBLIC_KEY))" \
  -var project_name=$PROJECT_NAME \
  -var machine_type=$MACHINE_TYPE \
  -var ssh_user_name=$SSH_USER_NAME \
  -var vm_name=$VM_NAME
fi

# plan apply destroy
