terraform {
  required_version = "~> 1.0"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.44"
    }
  }
  backend "remote" {
    organization = "shikanime"
    workspaces {
      name = "tfe-shikanime"
    }
  }
}
