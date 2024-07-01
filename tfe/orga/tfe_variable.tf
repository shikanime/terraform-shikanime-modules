resource "tfe_variable_set" "tfc" {
  for_each = {
    google-project-shikanime-studio      = {}
    google-project-shikanime-studio-labs = {}
  }
  name         = "TFC (${each.key})"
  description  = "TFC variables for ${each.key}"
  organization = tfe_organization.default.name
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_variable" "tfc_organization_id" {
  for_each        = tfe_variable_set.tfc
  key             = "tfc_organization_id"
  value           = data.tfe_organization.default.external_id
  category        = "terraform"
  description     = "Organization id"
  variable_set_id = tfe_variable_set.tfc[each.key].id
}

resource "tfe_variable" "tfc_workspace_id" {
  for_each        = tfe_variable_set.tfc
  key             = "tfc_workspace_id"
  value           = tfe_workspace.default[each.key].id
  category        = "terraform"
  description     = "Workspace id"
  variable_set_id = tfe_variable_set.tfc[each.key].id
}

resource "tfe_variable_set" "google_provider" {
  for_each = {
    shikanime-studio      = {}
    shikanime-studio-labs = {}
  }
  name         = "Google Provider (${each.key})"
  description  = "Google Provider variables for ${each.key}"
  organization = tfe_organization.default.name
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_variable" "tfc_google_provider_auth" {
  for_each        = tfe_variable_set.google_provider
  key             = "TFC_GCP_PROVIDER_AUTH"
  value           = "true"
  category        = "env"
  description     = "Enable GCP provider auth"
  variable_set_id = tfe_variable_set.google_provider[each.key].id
}

resource "tfe_variable" "tfc_google_project_number" {
  for_each = {
    shikanime-studio = {
      value = lookup(data.tfe_outputs.default["google-project-shikanime-studio"].values, "project_number", null)
    }
    shikanime-studio-labs = {
      value = lookup(data.tfe_outputs.default["google-project-shikanime-studio-labs"].values, "project_number", null)
    }
  }
  key             = "TFC_GCP_PROJECT_NUMBER"
  value           = each.value.value
  category        = "env"
  description     = "Project number"
  variable_set_id = tfe_variable_set.google_provider[each.key].id
}

resource "tfe_variable" "tfc_google_workload_pool_id" {
  for_each = {
    shikanime-studio = {
      value = lookup(data.tfe_outputs.default["google-project-shikanime-studio"].values, "workload_identity_pool_id", null)
    }
    shikanime-studio-labs = {
      value = lookup(data.tfe_outputs.default["google-project-shikanime-studio-labs"].values, "workload_identity_pool_id", null)
    }
  }
  key             = "TFC_GCP_WORKLOAD_POOL_ID"
  value           = each.value.value
  category        = "env"
  description     = "Workload pool id"
  variable_set_id = tfe_variable_set.google_provider[each.key].id
}

resource "tfe_variable" "tfc_workload_provider_id" {
  for_each = {
    shikanime-studio = {
      value = lookup(data.tfe_outputs.default["google-project-shikanime-studio"].values, "workload_identity_pool_provider_id", null)
    }
    shikanime-studio-labs = {
      value = lookup(data.tfe_outputs.default["google-project-shikanime-studio-labs"].values, "workload_identity_pool_provider_id", null)
    }
  }
  key             = "TFC_GCP_WORKLOAD_PROVIDER_ID"
  value           = each.value.value
  category        = "env"
  description     = "Workload provider id"
  variable_set_id = tfe_variable_set.google_provider[each.key].id
}

resource "tfe_variable" "tfc_run_service_account_email" {
  for_each = {
    shikanime-studio = {
      value = lookup(data.tfe_outputs.default["google-project-shikanime-studio"].values, "operator_service_accounts_email", null)
    }
    shikanime-studio-labs = {
      value = lookup(data.tfe_outputs.default["google-project-shikanime-studio-labs"].values, "operator_service_accounts_email", null)
    }
  }
  key             = "TFC_GCP_RUN_SERVICE_ACCOUNT_EMAIL"
  value           = each.value.value
  category        = "env"
  description     = "Run service account email"
  variable_set_id = tfe_variable_set.google_provider[each.key].id
}

resource "tfe_variable_set" "github_provider" {
  for_each = {
    shikanime     = {}
    totalenergies = {}
  }
  name         = "GitHub Provider (${each.key})"
  description  = "GitHub Provider variables for ${each.key}"
  organization = tfe_organization.default.name
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_variable_set" "cloudflare_provider" {
  for_each = {
    shikanime-studio = {}
  }
  name         = "Cloudflare Provider (${each.key})"
  description  = "Cloudflare Provider variables for ${each.key}"
  organization = tfe_organization.default.name
  lifecycle {
    prevent_destroy = true
  }
}

resource "tfe_variable_set" "wakatime" {
  for_each = {
    shikanime = {}
  }
  name         = "Wakatime (${each.key})"
  description  = "Wakatime variables for ${each.key}"
  organization = tfe_organization.default.name
  lifecycle {
    prevent_destroy = true
  }
}
