resource "cloudflare_zone" "default" {
  account_id = var.account_id
  zone       = "shikanime.studio"
}
