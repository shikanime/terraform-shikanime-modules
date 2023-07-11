terraform {
  required_version = "~> 1.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.8"
    }
  }
  backend "remote" {
    organization = "shikanime"
    workspaces {
      name = "cloudflare-shikanime-studio"
    }
  }
}
