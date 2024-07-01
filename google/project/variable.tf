variable "name" {
  type        = string
  description = "The name for the project"
}

variable "org_id" {
  type        = string
  description = "The organization ID"
  default     = ""
}

variable "billing_account_id" {
  type        = string
  description = "The ID of the billing account to associate this project with"
}

variable "location" {
  type        = string
  description = "The location for the resources"
}

variable "tfc_organization_id" {
  type        = string
  description = "TFC organization ID"
}

variable "tfc_workspace_id" {
  type        = string
  description = "TFC workspace ID"
}

variable "enabled_apis" {
  type        = list(string)
  description = "List of APIs to enable"
}

variable "members" {
  type = object({
    owner = list(string)
    cloud = list(string)
  })
  description = "List of members to grant roles"
}
