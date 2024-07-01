variable "organization_name" {
  type        = string
  description = "GitHub Organization Name"
}

variable "repository_name" {
  type        = string
  description = "GitHub Repository Name"
}

variable "cachix_token" {
  type        = string
  sensitive   = true
  description = "Cachix Token"
}

variable "wakatime_api_key" {
  type        = string
  sensitive   = true
  description = "Wakatime API Key"
}

variable "wakabox_github_gist_id" {
  type        = string
  description = "Wakabox GitHub Gist ID"
  default     = "18a5a8350c7bfe760adb6c37b6bbe5a9"
}

variable "wakabox_github_token" {
  type        = string
  sensitive   = true
  description = "Wakabox GitHub Token"
}
