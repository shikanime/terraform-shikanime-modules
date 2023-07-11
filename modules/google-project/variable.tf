variable "name" {
  type        = string
  description = "The name for the project"
  default     = "shikanime-studio"
}

variable "org_id" {
  type        = string
  description = "The organization ID"
  default     = ""
}

variable "billing_account" {
  type        = string
  description = "The ID of the billing account to associate this project with"
  default     = "018C2E-353598-F0F3A5"
}

variable "tfc_organization_id" {
  type        = string
  description = "TFC organization ID"
}

variable "tfc_workspace_id" {
  type        = string
  description = "TFC workspace ID"
}