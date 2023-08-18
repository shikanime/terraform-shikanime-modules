module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.2"

  name            = var.name
  org_id          = var.organization_id
  billing_account = var.billing_account_id
  activate_apis   = var.activate_apis
}
