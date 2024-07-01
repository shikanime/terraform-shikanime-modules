data "tfe_outputs" "default" {
  for_each     = tfe_workspace.default
  organization = tfe_organization.default.name
  workspace    = each.value.name
}
