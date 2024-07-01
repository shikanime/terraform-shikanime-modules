terraform {
  required_version = "~> 1.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.18"
    }
  }
  backend "remote" {
    organization = "shikanime"
    workspaces {
      prefix = "github-org-"
    }
  }
}
