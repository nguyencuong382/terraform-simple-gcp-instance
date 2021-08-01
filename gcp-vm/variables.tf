variable "machine_type" {
  default = "f1-micro"
}

variable "region" {
  default = "us-west1"
}

variable "region_zone" {
  default = "us-west1-a"
}

variable "project_name" {
  default = "myfirstproject"
}

variable "vm_name" {
  default = ""
}


variable "ssh_user_name" {
  default = "defaultuser"
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


