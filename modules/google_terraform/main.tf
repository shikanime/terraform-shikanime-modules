module "service_accounts" {
  source = "./modules/service_accounts"

  project_id   = var.project_id
  name         = var.name
  display_name = var.display_name
}

module "workload_identity" {
  source = "./modules/workload_identity"

  project_id              = var.project_id
  name                    = var.name
  display_name            = var.display_name
  terraform_organizations = var.terraform_organizations
}

module "service_accounts_iam" {
  source = "./modules/service_accounts_iam"

  count                       = length(var.terraform_workspace_ids)
  project_id                  = var.project_id
  service_account_emails      = module.service_accounts.service_account_emails
  workload_identity_pool_id   = module.workload_identity.workload_identity_pool_id
  workload_identity_pool_name = module.workload_identity.workload_identity_pool_name
  terraform_workspace_id      = var.terraform_workspace_ids[count.index]
}
