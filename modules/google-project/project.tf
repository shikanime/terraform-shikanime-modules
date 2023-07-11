module "google_project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 14.2"

  name            = var.name
  org_id          = var.org_id
  billing_account = var.billing_account
  activate_apis = [
    "iamcredentials.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "serviceusage.googleapis.com",
    "aiplatform.googleapis.com",
    "storage-component.googleapis.com",
    "notebooks.googleapis.com",
    "dataflow.googleapis.com",
    "artifactregistry.googleapis.com",
    "drive.googleapis.com",
    "run.googleapis.com",
    "firebasehosting.googleapis.com",
    "runapps.googleapis.com",
    "firestore.googleapis.com"
  ]
}
