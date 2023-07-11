module "tfc_service_account" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "~> 3.0"

  project_id   = module.google_project.project_id
  names        = ["tfc-service-account"]
  display_name = "Terraform Cloud Service account"

  project_roles = [
    "${module.google_project.project_id}=>roles/browser",
    "${module.google_project.project_id}=>roles/iam.securityAdmin",
    "${module.google_project.project_id}=>roles/iam.workloadIdentityPoolAdmin",
    "${module.google_project.project_id}=>roles/serviceusage.serviceUsageAdmin",
    "${module.google_project.project_id}=>roles/iam.serviceAccountAdmin",
  ]
}
