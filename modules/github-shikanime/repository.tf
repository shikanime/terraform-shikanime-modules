resource "github_repository" "default" {
  name                 = "shikanime"
  description          = "あらあらー\u3000( ⓛ ω ⓛ *)"
  has_downloads        = true
  has_issues           = true
  vulnerability_alerts = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch_protection" "main" {
  repository_id  = github_repository.default.node_id
  pattern        = "main"
  enforce_admins = true
}

resource "github_branch_protection" "releases" {
  repository_id  = github_repository.default.node_id
  pattern        = "release-*.*"
  enforce_admins = true
}

resource "github_repository_tag_protection" "default" {
  repository = github_repository.default.name
  pattern    = "v*.*.*"
}

resource "github_actions_secret" "cachix_token" {
  repository      = github_repository.default.name
  secret_name     = "CACHIX_AUTH_TOKEN"
  plaintext_value = var.cachix_token
}

resource "github_repository_environment" "wakabox" {
  repository  = github_repository.default.name
  environment = "shikanime-wakabox"
  deployment_branch_policy {
    protected_branches     = true
    custom_branch_policies = false
  }
}

resource "github_actions_environment_secret" "wakabox_wakatime" {
  repository      = github_repository.default.name
  environment     = github_repository_environment.wakabox.environment
  secret_name     = "WAKATIME_API_KEY"
  plaintext_value = var.wakatime_api_key
}
resource "github_actions_environment_variable" "wakabox_gist_id" {
  repository    = github_repository.default.name
  environment   = github_repository_environment.wakabox.environment
  variable_name = "WAKABOX_GITHUB_GIST_ID"
  value         = var.wakabox_github_gist_id
}

resource "github_actions_environment_secret" "wakabox_github_token" {
  repository      = github_repository.default.name
  environment     = github_repository_environment.wakabox.environment
  secret_name     = "WAKABOX_GITHUB_TOKEN"
  plaintext_value = var.wakabox_github_token
}

resource "github_repository" "algorithm" {
  name                 = "algorithm"
  description          = "My algorithms sketchbook"
  has_issues           = true
  vulnerability_alerts = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "github_branch_protection" "algorithm_main" {
  repository_id  = github_repository.algorithm.node_id
  pattern        = "main"
  enforce_admins = true
}

resource "github_branch_protection" "algorithm_releases" {
  repository_id  = github_repository.algorithm.node_id
  pattern        = "release-*.*"
  enforce_admins = true
}

resource "github_repository_tag_protection" "algorithm" {
  repository = github_repository.algorithm.name
  pattern    = "v*.*.*"
}

resource "github_actions_secret" "algorithm_cachix_token" {
  repository      = github_repository.algorithm.name
  secret_name     = "CACHIX_AUTH_TOKEN"
  plaintext_value = var.cachix_token
}
