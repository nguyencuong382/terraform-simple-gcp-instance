variable "region" {
  default = "us-west1"
}

variable "region_zone" {
  default = "us-west1-a"
}

variable "project_name" {
  default = "kubernetestestdeploy"
}

variable "credentials_fle_path" {
  default = "./credentials.json"
}

variable "credentials" {
  type = string
}

variable "public_key" {
  type = string
}

variable "private_key" {
  type = string
}


