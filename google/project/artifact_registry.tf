resource "google_artifact_registry_repository" "default" {
  project       = module.google_project.project_id
  repository_id = "${var.name}-containers"
  location      = var.location
  format        = "DOCKER"
}
