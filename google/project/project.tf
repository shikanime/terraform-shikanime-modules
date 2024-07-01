module "google_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 15.0"

  name            = var.name
  org_id          = var.org_id
  billing_account = var.billing_account_id
  project_sa_name = "project-operator"
  activate_apis   = var.enabled_apis
}
