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

variable "terraform_workspace_ids" {
  type        = list(string)
  description = "Terraform organizations"
  default = [
    "ws-bCCn34oVHy2V2d1x"
  ]
}
