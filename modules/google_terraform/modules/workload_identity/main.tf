data "google_project" "default" {
  project_id = var.project_id
}

resource "google_iam_workload_identity_pool" "default" {
  project                   = data.google_project.default.number
  workload_identity_pool_id = var.name
  display_name              = var.display_name
  description               = "Identity pool for Terraform Cloud Dynamic Credentials integration"
}

resource "google_iam_workload_identity_pool_provider" "default" {
  for_each                           = var.terraform_organizations
  project                            = data.google_project.default.number
  workload_identity_pool_id          = google_iam_workload_identity_pool.default.workload_identity_pool_id
  workload_identity_pool_provider_id = each.value.name
  display_name                       = each.value.display_name
  description                        = "Identity pool provider for Terraform Cloud Dynamic Credentials integration"
  # Use condition to make sure only token generated for a specific TFC Org can be used across org workspaces
  attribute_condition = "attribute.id == \"${each.value.id}\""
  attribute_mapping = {
    "google.subject"                        = "assertion.sub"
    "attribute.aud"                         = "assertion.aud"
    "attribute.terraform_run_phase"         = "assertion.terraform_run_phase"
    "attribute.terraform_project_id"        = "assertion.terraform_project_id",
    "attribute.terraform_project_name"      = "assertion.terraform_project_name",
    "attribute.terraform_workspace_id"      = "assertion.terraform_workspace_id"
    "attribute.terraform_workspace_name"    = "assertion.terraform_workspace_name"
    "attribute.id"                          = "assertion.id"
    "attribute.terraform_organization_name" = "assertion.terraform_organization_name"
    "attribute.terraform_run_id"            = "assertion.terraform_run_id"
    "attribute.terraform_full_workspace"    = "assertion.terraform_full_workspace"
  }
  oidc {
    issuer_uri = "https://app.terraform.io/"
  }
}
