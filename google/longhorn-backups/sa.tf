module "service_accounts" {
  source       = "terraform-google-modules/service-accounts/google"
  version      = "~> 4.0"
  project_id   = var.project_id
  names        = ["longhorn-backups"]
  display_name = "Longhorn Backups Service Account"
}
