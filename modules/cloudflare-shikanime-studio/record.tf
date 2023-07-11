resource "cloudflare_record" "default" {
  for_each = {
    for record in var.records : record.name => record
  }
  zone_id = cloudflare_zone.default.id
  name    = each.value.name
  value   = each.value.value
  type    = each.value.type
  ttl     = each.value.ttl
}
