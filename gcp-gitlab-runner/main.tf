# Configure GCP provider
provider "google" {
  version = "~> 2.13"
  project = var.gcp_project
  region  = var.gcp_region
  credentials = file("${var.credentials_fle_path}")
}

# Install the GitLab CI Runner infrastructure
module "ci" {
  source      = "mantel-digio/gitlab-runner/google"
  version     = "0.0.9"

  gcp_project = var.gcp_project
  gcp_zone    = var.gcp_zone
  gitlab_url  = var.gitlab_url
  ci_token    = var.ci_token
}

# Grant the storage.admin role to the CI workers.  Add other roles as required.
resource "google_project_iam_member" "worker_storage_admin" {
  role   = "roles/storage.admin"
  member = "serviceAccount:${module.ci.ci_worker_service_account.email}"
}