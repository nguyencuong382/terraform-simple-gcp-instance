#!/bin/bash


terraform apply \
  -var gcp_project=kubernetestestdeploy \
  -var gcp_region=us-west1 \
  -var gcp_zone=us-west1-a \
  -var gitlab_url=https://gitlab.com/ \
  -var ci_token=u9g2G9uij-gNuUvAKMeQ