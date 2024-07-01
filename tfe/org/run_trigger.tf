resource "tfe_run_trigger" "default" {
  for_each = {
    google-project-shikanime-studio = {
      workspace_id = tfe_workspace.default["tfe-shikanime"].id
    }
    google-project-shikanime-studio-labs = {
      workspace_id = tfe_workspace.default["tfe-shikanime"].id
    }
  }
  workspace_id  = each.value.workspace_id
  sourceable_id = tfe_workspace.default[each.key].id
}
