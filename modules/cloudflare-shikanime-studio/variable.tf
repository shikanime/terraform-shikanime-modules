variable "account_id" {
  type        = string
  description = "The ID of the Cloudflare account to use"
  default     = "d4e789904d6943d8cd524e19c5cb36bd"
}

variable "forwardings" {
  type = list(object({
    alias      = string
    recipients = list(string)
  }))
  description = "Email forwarding rules to create"
}

variable "emails" {
  type        = list(string)
  description = "Email addresses to create"
}

variable "records" {
  type = list(object({
    name  = string
    value = string
    type  = string
    ttl   = number
  }))
  description = "DNS records to create"
}
