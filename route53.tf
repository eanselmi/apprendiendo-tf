resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81__045e106fc5fba355b2bea6637fa58057-002E-apprendiendo-002E-net-002E-apprendiendo-002E-net-002E-_CNAME_" {
  name    = "_045e106fc5fba355b2bea6637fa58057.apprendiendo.net.apprendiendo.net"
  records = ["7D17054F1C9B762C43496F34B57713D4.C82B705209436F33A3550AD753A2CF8D.9406b709a175a03.comodoca.com"]
  ttl     = "3600"
  type    = "CNAME"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81__4c9d190f1b08e6d44e75cc8876d0f703-002E-www-002E-apprendiendo-002E-net-002E-_CNAME_" {
  name    = "_4c9d190f1b08e6d44e75cc8876d0f703.www.apprendiendo.net"
  records = ["_af5f685f24c1caaa57bfe63bd00903c2.qwknvqrlct.acm-validations.aws."]
  ttl     = "60"
  type    = "CNAME"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
}

resource "aws_route53_record" "tfer--Z00421092ER17TA7ZWT81__ca610b479e2e9cabb270ae96483e7680-002E-apprendiendo-002E-net-002E-_CNAME_" {
  name    = "_ca610b479e2e9cabb270ae96483e7680.apprendiendo.net"
  records = ["_453d7feb4fc42436549385fadc242f30.qwknvqrlct.acm-validations.aws."]
  ttl     = "60"
  type    = "CNAME"
  zone_id = aws_route53_zone.tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net.zone_id
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

resource "aws_route53_record" "tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar-002E-_MX_" {
  name    = "legaleslara.com.ar"
  records = ["1 ASPMX.L.GOOGLE.COM.", "10 ALT3.ASPMX.L.GOOGLE.COM.", "10 ALT4.ASPMX.L.GOOGLE.COM.", "5 ALT1.ASPMX.L.GOOGLE.COM.", "5 ALT2.ASPMX.L.GOOGLE.COM."]
  ttl     = "3600"
  type    = "MX"
  zone_id = aws_route53_zone.tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar.zone_id
}

resource "aws_route53_record" "tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar-002E-_NS_" {
  name    = "legaleslara.com.ar"
  records = ["ns-1044.awsdns-02.org.", "ns-157.awsdns-19.com.", "ns-2010.awsdns-59.co.uk.", "ns-854.awsdns-42.net."]
  ttl     = "172800"
  type    = "NS"
  zone_id = aws_route53_zone.tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar.zone_id
}

resource "aws_route53_record" "tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar-002E-_SOA_" {
  name    = "legaleslara.com.ar"
  records = ["ns-1044.awsdns-02.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl     = "900"
  type    = "SOA"
  zone_id = aws_route53_zone.tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar.zone_id
}

resource "aws_route53_record" "tfer--Z0997941V5WN6N2SL9IP_test-002E-legaleslara-002E-com-002E-ar-002E-_A_" {
  name    = "test.legaleslara.com.ar"
  records = ["192.168.1.30"]
  ttl     = "60"
  type    = "A"
  zone_id = aws_route53_zone.tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar.zone_id
}

resource "aws_route53_zone" "tfer--Z00421092ER17TA7ZWT81_apprendiendo-002E-net" {
  comment       = "HostedZone created by Route53 Registrar"
  force_destroy = "false"
  name          = "apprendiendo.net"
}

resource "aws_route53_zone" "tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar" {
  force_destroy = "false"
  name          = "legaleslara.com.ar"
}
