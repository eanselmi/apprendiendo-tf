resource "aws_cloudfront_distribution" "tfer--E27BUQA8Y482SH" {
  aliases = ["apprendiendo.net", "error.apprendiendo.net", "www.apprendiendo.net"]

  custom_error_response {
    error_caching_min_ttl = "10"
    error_code            = "403"
    response_code         = "200"
    response_page_path    = "/error.html"
  }

  default_cache_behavior {
    allowed_methods        = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods         = ["GET", "HEAD"]
    compress               = "true"
    default_ttl            = "0"
    max_ttl                = "0"
    min_ttl                = "0"
    smooth_streaming       = "false"
    target_origin_id       = "apprendiendo.net"
    viewer_protocol_policy = "redirect-to-https"
  }

  default_root_object = "index.html"
  enabled             = "true"
  http_version        = "http2"
  is_ipv6_enabled     = "true"

  ordered_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
    cached_methods         = ["GET", "HEAD"]
    compress               = "true"
    default_ttl            = "0"
    max_ttl                = "0"
    min_ttl                = "0"
    path_pattern           = "/error.html"
    smooth_streaming       = "false"
    target_origin_id       = "error.apprendiendo.net"
    viewer_protocol_policy = "redirect-to-https"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"
    domain_name         = "apprendiendo-errors.s3.us-east-1.amazonaws.com"
    origin_id           = "error.apprendiendo.net"
  }

  origin {
    connection_attempts = "3"
    connection_timeout  = "10"
    domain_name         = "apprendiendo-naza.s3.us-east-1.amazonaws.com"
    origin_id           = "apprendiendo.net"
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      locations        = ["AR"]
      restriction_type = "whitelist"
    }
  }
  retain_on_delete = "false"
  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:563337348171:certificate/3c637f05-ccd9-4b0f-938e-cefe1c0dab97"
    cloudfront_default_certificate = "false"
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}
