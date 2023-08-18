module "service_accounts_iam" {
  source  = "terraform-google-modules/iam/google//modules/service_accounts_iam"
  version = "~> 7.6"

  service_accounts = var.service_account_emails
  project          = var.project_id
  mode             = "authoritative"
  bindings = {
    "roles/iam.workloadIdentityUser" = [
      join("/", [
        "principalSet://iam.googleapis.com",
        var.workload_identity_pool_name,
        "attribute.terraform_workspace_id",
        var.terraform_workspace_id
      ])
    ]
  }
}
