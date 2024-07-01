terraform {
  required_version = "~> 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.36"
    }
  }
  backend "remote" {
    organization = "shikanime"
    workspaces {
      prefix = "google-longhorn-backups-"
    }
  }
}
