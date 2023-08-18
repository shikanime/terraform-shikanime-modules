variable "project_id" {
  type        = string
  description = "Project id"
  default     = "studio-project-hub"
}

variable "name" {
  type        = string
  description = "Name"
  default     = "terraform"
}

variable "display_name" {
  type        = string
  description = "Display name"
  default     = "Terraform"
}

variable "terraform_organizations" {
  type = map(object({
    id           = string
    name         = string
    display_name = string
  }))
  description = "Terraform organizations"
  default = {
    shikanime = {
      id           = "org-ZuQrk9oiA78Cy3Ls"
      name         = "shikanime"
      display_name = "Shikanime"
    }
  }
}

variable "terraform_workspaces" {
  type = map(object({
    id           = string
    project_id   = string
    name         = string
    display_name = string
  }))
  description = "Terraform workspaces"
  default = {
    google-project-studio-project-hub = {
      id           = "ws-bCCn34oVHy2V2d1x"
      project_id   = "studio-project-hub"
      name         = "terraform-project"
      display_name = "Shikanime Studio Project Hub"
    }
    google-terraform-studio-project-hub = {
      id           = "ws-NSDVP6ZJcpQPcano"
      project_id   = "studio-project-hub"
      name         = "terraform"
      display_name = "Shikanime Studio Project Hub Terraform"
    }
  }
}
