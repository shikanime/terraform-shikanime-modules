module "service_accounts" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "~> 3.0"

  project_id   = var.project_id
  names        = [var.name]
  display_name = "${var.display_name} Service Account"

  project_roles = [
    "${var.project_id}=>roles/browser",
    "${var.project_id}=>roles/iam.securityAdmin",
    "${var.project_id}=>roles/iam.workloadIdentityPoolAdmin",
    "${var.project_id}=>roles/serviceusage.serviceUsageAdmin",
    "${var.project_id}=>roles/iam.serviceAccountAdmin",
  ]
}
