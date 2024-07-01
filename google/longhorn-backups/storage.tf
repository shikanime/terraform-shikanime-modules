module "storage" {
  source  = "terraform-google-modules/cloud-storage/google"
  version = "~> 6.0"

  project_id      = var.project_id
  location        = var.location
  names           = ["longhorn-backups"]
  prefix          = "${var.project_id}-${var.location}"
  set_admin_roles = true
  admins          = module.service_accounts.iam_emails_list
  set_hmac_access = true
  hmac_service_accounts = {
    "${module.service_accounts.email}" = "ACTIVE"
  }
  lifecycle_rules = [
    {
      action = {
        type          = "SetStorageClass"
        storage_class = "NEARLINE"
      }
      condition = {
        matches_suffix = ".blk"
      }
    },
    {
      action = {
        type          = "SetStorageClass"
        storage_class = "COLDLINE"
      }
      condition = {
        matches_suffix = ".blk"
        age            = 30
      },
    },
    {
      action = {
        type          = "SetStorageClass"
        storage_class = "ARCHIVE"
      }
      condition = {
        matches_suffix = ".blk"
        age            = 90
      },
    }
  ]
}
