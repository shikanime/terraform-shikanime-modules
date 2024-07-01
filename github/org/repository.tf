data "github_repository" "default" {
  full_name = "${var.organization_name}/${var.repository_name}"
}

resource "github_branch_protection" "main" {
  repository_id  = data.github_repository.default.node_id
  pattern        = "main"
  enforce_admins = true
}

resource "github_branch_protection" "releases" {
  repository_id  = data.github_repository.default.node_id
  pattern        = "release-*.*"
  enforce_admins = true
}

resource "github_repository_tag_protection" "default" {
  repository = data.github_repository.default.name
  pattern    = "v*.*.*"
}

resource "github_actions_secret" "cachix_token" {
  repository      = data.github_repository.default.name
  secret_name     = "CACHIX_AUTH_TOKEN"
  plaintext_value = var.cachix_token
}

resource "github_repository_environment" "wakabox" {
  repository  = data.github_repository.default.name
  environment = "shikanime-wakabox"
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

resource "github_actions_environment_secret" "wakabox_wakatime" {
  repository      = data.github_repository.default.name
  environment     = github_repository_environment.wakabox.environment
  secret_name     = "WAKATIME_API_KEY"
  plaintext_value = var.wakatime_api_key
}
resource "github_actions_environment_variable" "wakabox_gist_id" {
  repository    = data.github_repository.default.name
  environment   = github_repository_environment.wakabox.environment
  variable_name = "WAKABOX_GITHUB_GIST_ID"
  value         = var.wakabox_github_gist_id
}

resource "github_actions_environment_secret" "wakabox_github_token" {
  repository      = data.github_repository.default.name
  environment     = github_repository_environment.wakabox.environment
  secret_name     = "WAKABOX_GITHUB_TOKEN"
  plaintext_value = var.wakabox_github_token
}
