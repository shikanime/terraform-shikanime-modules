variable "project_id" {
  type        = string
  description = "Project ID"
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
}
