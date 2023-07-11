resource "tfe_workspace" "default" {
  for_each = {
    tfe-shikanime = {
      name              = "tfe-shikanime"
      display_name      = "Terrafom Cloud Shikanime"
      description       = "Terrafom Cloud Shikanime"
      working_directory = "modules/tfe-shikanime"
    }
    github-shikanime = {
      name              = "github-shikanime"
      display_name      = "GitHub Shikanime"
      description       = "GitHub Shikanime"
      working_directory = "modules/github-shikanime"
    }
    github-totalenergies = {
      name              = "github-totalenergies"
      display_name      = "GitHub TotalEnergies"
      description       = "GitHub TotalEnergies"
      working_directory = "modules/github-totalenergies"
    }
    google-project-shikanime-studio = {
      name              = "google-project-shikanime-studio"
      display_name      = "Google Shikanime Studio"
      description       = "Google Shikanime Studio"
      working_directory = "modules/google-project"
    }
    google-project-shikanime-studio-labs = {
      name              = "google-project-shikanime-studio-labs"
      display_name      = "Google Shikanime Studio Labs"
      description       = "Google Shikanime Studio Labs"
      working_directory = "modules/google-project"
    }
    cloudflare-shikanime-studio = {
      name              = "cloudflare-shikanime-studio"
      display_name      = "Cloudflare Shikanime Studio"
      description       = "Cloudflare Shikanime Studio"
      working_directory = "modules/cloudflare-shikanime-studio"
    }
    vercel-shikanime-studio = {
      name              = "vercel-shikanime-studio"
      display_name      = "Vercel Shikanime Studio"
      description       = "Vercel Shikanime Studio"
      working_directory = "modules/vercel-shikanime-studio"
    }
  }
  name              = each.value.name
  organization      = tfe_organization.default.name
  terraform_version = "1.5.1"
  auto_apply        = true
  vcs_repo {
    identifier                 = "shikanime/terraform-shikanime-modules"
    github_app_installation_id = "ghain-jGUbBPSwRf4ceNGo"
  }
  working_directory = each.value.working_directory
  description       = each.value.description
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_variable" "google_project_name" {
  for_each = {
    google-project-shikanime-studio = {
      name = "shikanime-studio"
    }
    google-project-shikanime-studio-labs = {
      name = "shikanime-studio-labs"
    }
  }
  key          = "name"
  value        = each.value.name
  category     = "terraform"
  workspace_id = tfe_workspace.default[each.key].id
  description  = "Project Factory"
}

resource "tfe_workspace_variable_set" "tfc" {
  for_each = {
    google-project-shikanime-studio = {
      variable_set_id = tfe_variable_set.tfc["google-project-shikanime-studio"].id
    }
    google-project-shikanime-studio-labs = {
      variable_set_id = tfe_variable_set.tfc["google-project-shikanime-studio-labs"].id
    }
  }
  workspace_id    = tfe_workspace.default[each.key].id
  variable_set_id = each.value.variable_set_id
}

resource "tfe_workspace_variable_set" "google_provider" {
  for_each = {
    google-project-shikanime-studio = {
      variable_set_id = tfe_variable_set.google_provider["shikanime-studio"].id
    }
    google-project-shikanime-studio-labs = {
      variable_set_id = tfe_variable_set.google_provider["shikanime-studio-labs"].id
    }
  }
  workspace_id    = tfe_workspace.default[each.key].id
  variable_set_id = each.value.variable_set_id
}

resource "tfe_workspace_variable_set" "cloudflare_provider" {
  for_each = {
    cloudflare-shikanime-studio = {
      variable_set_id = tfe_variable_set.cloudflare_provider["shikanime-studio"].id
    }
  }
  workspace_id    = tfe_workspace.default[each.key].id
  variable_set_id = each.value.variable_set_id
}

resource "tfe_workspace_variable_set" "github_provider" {
  for_each = {
    github-shikanime = {
      variable_set_id = tfe_variable_set.github_provider["shikanime"].id
    }
    github-totalenergies = {
      variable_set_id = tfe_variable_set.github_provider["totalenergies"].id
    }
  }
  workspace_id    = tfe_workspace.default[each.key].id
  variable_set_id = each.value.variable_set_id
}

resource "tfe_workspace_variable_set" "wakatime" {
  for_each = {
    github-shikanime = {
      variable_set_id = tfe_variable_set.wakatime["shikanime"].id
    }
  }
  workspace_id    = tfe_workspace.default[each.key].id
  variable_set_id = each.value.variable_set_id
}
