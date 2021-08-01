variable "gcp_project" {
  type        = string
  description = "The GCP project to deploy the runner into."
}
variable "gcp_zone" {
  type        = string
  description = "The GCP zone to deploy the runner into."
}
variable "gcp_region" {
  type        = string
  description = "The GCP region to deploy the runner into."
}
variable "gitlab_url" {
  type        = string
  description = "The URL of the GitLab server hosting the projects to be built."
}
variable "ci_token" {
  type        = string
  description = "The runner registration token obtained from GitLab."
}
variable "ci_runner_instance_type" {
  type        = string
  default     = "f1-micro"
  description = <<EOF
The instance type used for the runner. This shouldn't need to be changed because the builds
themselves run on separate worker instances.
EOF
}
variable "ci_concurrency" {
  type        = number
  default     = 1
  description = "The maximum number of worker instances to create."
}
variable "ci_worker_idle_time" {
  type        = number
  default     = 300
  description = "The maximum idle time for workers before they are shutdown."
}
variable "ci_worker_instance_type" {
  type        = string
  default     = "n1-standard-1"
  description = "The worker instance size.  This can be adjusted to meet the demands of builds jobs."
}
variable "credentials_fle_path" {
  default = "./credentials.json"
}