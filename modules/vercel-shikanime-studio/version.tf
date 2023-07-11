terraform {
  required_version = "~> 1.0"
  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "~> 0.14"
    }
  }
  backend "remote" {
    organization = "shikanime"
    workspaces {
      name = "vercel-shikanime-studio"
    }
  }
}
