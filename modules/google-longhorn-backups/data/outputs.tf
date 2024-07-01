output "hmac_keys" {
    value = {
        for key in google_storage_bucket.hmac_keys : key.name => key.secret
    }
    description = "The HMAC keys for the buckets"
    }
