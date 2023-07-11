output "project_number" {
  value       = module.google_project.project_number
  description = "Project id"
}

output "workload_identity_pool_id" {
  value       = google_iam_workload_identity_pool.tfc.workload_identity_pool_id
  description = "Workload pool id"
}

output "workload_identity_pool_provider_id" {
  value       = google_iam_workload_identity_pool_provider.tfc.workload_identity_pool_provider_id
  description = "Workload provider id"
}

output "tfc_service_account_email" {
  value       = module.tfc_service_account.email
  description = "TFC service account email"
}
