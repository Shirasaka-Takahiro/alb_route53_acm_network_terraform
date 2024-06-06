##Route53 Records
resource "aws_route53_record" "default" {
  zone_id = var.zone_id
  name    = var.zone_name
  type    = var.record_type
  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

#resource "aws_route53_record" "option" {
#  zone_id = aws_route53_zone.primary_zone.zone_id
#  zone_id = var.zone_id
#  name    = var.zone_name
#  type = var.record_type
#  ttl     = 300
#  records = var.record
#}