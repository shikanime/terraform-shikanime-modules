resource "github_user_ssh_key" "default" {
  for_each = var.github.ssh_keys
  title    = title(each.value.name)
  key      = each.value.public_key_openssh
}
