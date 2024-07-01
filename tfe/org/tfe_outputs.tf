data "tfe_outputs" "default" {
  for_each     = {
    google-project-shikanime-studio = {
      name = "google-project-shikanime-studio"
    }
    google-project-shikanime-studio-labs = {
      name = "google-project-shikanime-studio-labs"
    }
  }
  organization = tfe_organization.default.name
  workspace    = each.value.name
}
