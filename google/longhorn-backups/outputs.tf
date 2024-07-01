output "hmac_keys" {
  value       = module.storage.hmac_keys
  description = "The HMAC keys for the buckets"
  sensitive   = true
}
