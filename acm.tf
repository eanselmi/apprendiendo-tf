
resource "aws_acm_certificate" "tfer--3c637f05-ccd9-4b0f-938e-cefe1c0dab97_-002A--002E-apprendiendo-002E-net" {
  domain_name = "*.apprendiendo.net"
  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
  subject_alternative_names = ["apprendiendo.net"]
  validation_method         = "DNS"
}
