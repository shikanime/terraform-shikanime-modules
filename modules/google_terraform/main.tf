module "workload_identity" {
  source = "./modules/workload_identity"

  project_id              = var.project_id
  name                    = var.name
  display_name            = var.display_name
  terraform_organizations = var.terraform_organizations
}

module "service_accounts" {
  source = "./modules/service_accounts"

  for_each     = var.terraform_workspaces
  project_id   = each.value.project_id
  name         = each.value.name
  display_name = each.value.display_name
}

module "service_accounts_iam" {
  source = "./modules/service_accounts_iam"

  for_each                    = var.terraform_workspaces
  project_id                  = var.project_id
  service_account_emails      = module.service_accounts[each.key].service_account_emails
  workload_identity_pool_id   = module.workload_identity.workload_identity_pool_id
  workload_identity_pool_name = module.workload_identity.workload_identity_pool_name
  terraform_workspace_id      = each.value.id
}
