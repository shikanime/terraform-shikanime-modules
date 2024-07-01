output "workload_identity_pool_id" {
  value       = google_iam_workload_identity_pool.tfc.workload_identity_pool_id
  description = "Workload pool id"
}

output "workload_identity_pool_provider_id" {
  value       = google_iam_workload_identity_pool_provider.tfc.workload_identity_pool_provider_id
  description = "Workload provider id"
}

output "service_accounts_email" {
  value       = module.operator_service_accounts.email
  description = "Operator service accounts email"
}
