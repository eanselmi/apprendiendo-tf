resource "aws_route53_zone" "tfer--Z0997941V5WN6N2SL9IP_legaleslara-002E-com-002E-ar" {
  force_destroy = "false"
  name          = "legaleslara.com.ar"
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
