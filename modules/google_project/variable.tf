variable "name" {
  type        = string
  description = "Project name"
  default     = "studio-project-hub"
}

variable "organization_id" {
  type        = string
  description = "Organization ID"
  default     = ""
}

variable "billing_account_id" {
  type        = string
  description = "ID of the billing account to associate this project with"
  default     = "018C2E-353598-F0F3A5"
}

variable "activate_apis" {
  type        = list(string)
  description = "List of APIs to activate in the project"
  default     = []
}
