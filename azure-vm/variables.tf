# Define the common tags for all resources.
variable "tags" {
  description = "A map of the tags to use for the resources that are deployed."
  type        = "map"

  default = {
    name                  = "HighCharity Infra"
    tier                  = "Infrastructure"
    application           = "HighCharity"
    applicationversion    = "1.0.0"
    environment           = "Sandbox"
    infrastructureversion = "1.0.0"
    projectcostcenter     = "0570025003"
    operatingcostcenter   = "0570025003"
    owner                 = "nguyenmanhcuong382@outlook.com"
    securitycontact       = "nguyenmanhcuong382@outlook.com"
    confidentiality       = "PII/PHI"
    compliance            = "HIPAA"
  }
}

# Define prefix for consistent resource naming.
variable "resource_prefix" {
  type        = "string"
  default     = "terraform-az"
  description = "Service prefix to use for naming of resources."
}

# Define Azure region for resource placement.
variable "location" {
  type        = "string"
  default     = "northeurope"
  description = "Azure region for deployment of resources."
}

# Define username for use on the hosts.
variable "username" {
  type        = "string"
  default     = "nc"
  description = "Username to build and use on the VM hosts."
}

# Define username for use on the hosts.
variable "disk_size" {
  type        = "string"
  default     = "30"
  description = "Disk size of of vm"
}

variable "public_key" {
  type = "string"
  default = ""
}

variable "instance_type" {
  type = "string"
  default = "Standard_B1ms"
}
