resource "tfe_organization" "default" {
  name  = "shikanime"
  email = "engineering@shikanime.studio"
  lifecycle {
    prevent_destroy = true
  }
}

data "tfe_organization" "default" {
  name = tfe_organization.default.name
}
