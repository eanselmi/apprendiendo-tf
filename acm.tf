
resource "aws_acm_certificate" "apprendiendo_wildcard" {
  domain_name = "*.apprendiendo.net"
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
  subject_alternative_names = ["apprendiendo.net"]
  validation_method         = "DNS"
}
