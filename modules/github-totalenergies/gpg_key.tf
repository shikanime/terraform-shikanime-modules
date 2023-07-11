resource "github_user_gpg_key" "default" {
  for_each           = var.github.gpg_keys
  armored_public_key = each.value.public_key_armored
  lifecycle {
    prevent_destroy = true
  }
}
