module "operator_service_accounts" {
  source  = "terraform-google-modules/service-accounts/google"
  version = "~> 3.0"

  project_id   = module.google_project.project_id
  names        = ["infra-operator"]
  display_name = "Infrastructure Operator Service Account"

  project_roles = [
    "${module.google_project.project_id}=>roles/browser",
    "${module.google_project.project_id}=>roles/iam.securityAdmin",
    "${module.google_project.project_id}=>roles/iam.workloadIdentityPoolAdmin",
    "${module.google_project.project_id}=>roles/serviceusage.serviceUsageAdmin",
    "${module.google_project.project_id}=>roles/iam.serviceAccountAdmin",
  ]
}
