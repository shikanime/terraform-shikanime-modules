variable "project_id" {
  type        = string
  description = "Project name"
}

variable "workload_identity_pool_id" {
  type        = string
  description = "Workload Identity Pool ID"
}

variable "workload_identity_pool_name" {
  type        = string
  description = "Workload Identity Pool Name"
}

variable "terraform_workspace_id" {
  type        = string
  description = "Workspace ID"
}

variable "service_account_emails" {
  type        = list(string)
  description = "List of service accounts for the role bindings"
}
