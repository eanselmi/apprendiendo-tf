resource "aws_route53_zone" "tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net" {
  comment       = "HostedZone created by Route53 Registrar"
  force_destroy = "false"
  name          = "apprendiendo.net"
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81_api-002E-apprendiendo-002E-net-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "alb-backend-1940508238.us-east-1.elb.amazonaws.com"
    zone_id                = "Z35SXDOTRQ7X7K"
  }

  name    = "api.apprendiendo.net"
  type    = "A"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "d3rx9e2e18mjp1.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }

  name    = "apprendiendo.net"
  type    = "A"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net-002E-_NS_" {
  name    = "apprendiendo.net"
  records = ["ns-1352.awsdns-41.org.", "ns-177.awsdns-22.com.", "ns-1851.awsdns-39.co.uk.", "ns-875.awsdns-45.net."]
  ttl     = "172800"
  type    = "NS"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net-002E-_SOA_" {
  name    = "apprendiendo.net"
  records = ["ns-1851.awsdns-39.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl     = "900"
  type    = "SOA"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81_error-002E-apprendiendo-002E-net-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "d3rx9e2e18mjp1.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }

  name    = "error.apprendiendo.net"
  type    = "A"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81_vpn-002E-apprendiendo-002E-net-002E-_CNAME_" {
  name    = "vpn.apprendiendo.net"
  records = ["ec2-18-205-2-38.compute-1.amazonaws.com"]
  ttl     = "60"
  type    = "CNAME"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81_www-002E-apprendiendo-002E-net-002E-_A_" {
  alias {
    evaluate_target_health = "false"
    name                   = "d3rx9e2e18mjp1.cloudfront.net"
    zone_id                = "Z2FDTNDATAQYW2"
  }
  name    = "www.apprendiendo.net"
  type    = "A"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81__ca610b479e2e9cabb270ae96483e7680-002E-apprendiendo-002E-net-002E-_CNAME_" {
  name    = "_ca610b479e2e9cabb270ae96483e7680.apprendiendo.net"
  records = ["_453d7feb4fc42436549385fadc242f30.qwknvqrlct.acm-validations.aws."]
  ttl     = "60"
  type    = "CNAME"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

