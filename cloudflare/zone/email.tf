resource "cloudflare_email_routing_rule" "forwarding" {
  for_each = {
    for forwarding in var.forwardings : forwarding.alias => forwarding
  }
  zone_id = cloudflare_zone.default.id
  name    = "forward for ${each.value.alias}"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = each.value.alias
  }

  action {
    type  = "forward"
    value = each.value.recipients
  }
}

resource "cloudflare_email_routing_settings" "default" {
  zone_id = cloudflare_zone.default.id
  enabled = "true"
}

resource "cloudflare_email_routing_address" "default" {
  for_each = {
    for email in var.emails : email => email
  }
  account_id = var.account_id
  email      = each.value
}
