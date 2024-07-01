data "github_repository" "default" {
  full_name                 = var.repository
}

resource "github_branch_protection" "main" {
  repository_id  = data.github_repository.default.node_id
  pattern        = "main"
  enforce_admins = true
  require_signed_commits = true
  require_conversation_resolution = true
  required_pull_request_reviews {
    require_code_owner_reviews = true
  }
  required_status_checks {
    strict = true
  }
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
