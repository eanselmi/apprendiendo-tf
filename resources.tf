resource "aws_acm_certificate" "tfer--3c637f05-ccd9-4b0f-938e-cefe1c0dab97_-002A--002E-apprendiendo-002E-net" {
  domain_name = "*.apprendiendo.net"

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }

  subject_alternative_names = ["apprendiendo.net"]





  validation_method = "DNS"
}

resource "aws_budgets_budget" "tfer--Apprendiendo" {
  account_id  = "563337348171"
  budget_type = "COST"

  cost_types {
    include_credit             = "false"
    include_discount           = "true"
    include_other_subscription = "true"
    include_recurring          = "true"
    include_refund             = "false"
    include_subscription       = "true"
    include_support            = "true"
    include_tax                = "true"
    include_upfront            = "true"
    use_amortized              = "false"
    use_blended                = "false"
  }

  limit_amount = "15.0"
  limit_unit   = "USD"
  name         = "Apprendiendo"

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["nazareno.anselmi@gmail.com"]
    threshold                  = "50"
    threshold_type             = "PERCENTAGE"
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["nazareno.anselmi@gmail.com"]
    threshold                  = "75"
    threshold_type             = "PERCENTAGE"
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["nazareno.anselmi@gmail.com"]
    threshold                  = "90"
    threshold_type             = "PERCENTAGE"
  }

  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2021-06-01_00:00"
  time_unit         = "MONTHLY"
}

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

resource "aws_cloudwatch_dashboard" "tfer--Apprendiendo" {
  dashboard_body = "{\"widgets\":[]}"
  dashboard_name = "Apprendiendo"
}

resource "aws_db_instance" "tfer--apprendiendo" {
  allocated_storage                     = "20"
  auto_minor_version_upgrade            = "true"
  availability_zone                     = "us-east-1a"
  backup_retention_period               = "7"
  backup_window                         = "03:07-03:37"
  ca_cert_identifier                    = "rds-ca-2019"
  copy_tags_to_snapshot                 = "true"
  customer_owned_ip_enabled             = "false"
  db_subnet_group_name                  = aws_db_subnet_group.tfer--default-vpc-0a959fbbb6e218290.name
  deletion_protection                   = "false"
  engine                                = "mysql"
  engine_version                        = "8.0.23"
  iam_database_authentication_enabled   = "true"
  identifier                            = "apprendiendo"
  instance_class                        = "db.t2.micro"
  iops                                  = "0"
  license_model                         = "general-public-license"
  maintenance_window                    = "wed:04:14-wed:04:44"
  max_allocated_storage                 = "0"
  monitoring_interval                   = "0"
  multi_az                              = "false"
  option_group_name                     = "default:mysql-8-0"
  parameter_group_name                  = "default.mysql8.0"
  performance_insights_enabled          = "false"
  performance_insights_retention_period = "0"
  port                                  = "3306"
  publicly_accessible                   = "false"
  storage_encrypted                     = "false"
  storage_type                          = "gp2"

  tags = {
    Name = "Apprendiendo_DB"
  }



  username               = "admin"
  vpc_security_group_ids = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--RDS-Apprendiendo_sg-0a846758c5cf449b9_id}"]
}

resource "aws_db_subnet_group" "tfer--default-vpc-0a959fbbb6e218290" {
  description = "Created from the RDS Management Console"
  name        = "default-vpc-0a959fbbb6e218290"
  subnet_ids  = ["${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-02cb4bb032092bb77_id}", "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0b509a1c548112f21_id}", "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0e577e9cdf572d8ca_id}"]
}

resource "aws_docdb_subnet_group" "tfer--default-vpc-0a959fbbb6e218290" {
  description = "Created from the RDS Management Console"
  name        = "default-vpc-0a959fbbb6e218290"
  subnet_ids  = ["subnet-02cb4bb032092bb77", "subnet-0b509a1c548112f21", "subnet-0e577e9cdf572d8ca"]
}

resource "aws_iam_group" "tfer--Admin" {
  name = "Admin"
  path = "/"
}

resource "aws_iam_group" "tfer--S3" {
  name = "S3"
  path = "/"
}

resource "aws_iam_group_policy" "tfer--Admin_AwsFullAdmin" {
  group = "Admin"
  name  = "AwsFullAdmin"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "*",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}



resource "aws_iam_group_policy_attachment" "tfer--S3_AmazonS3FullAccess" {
  group      = "S3"
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_instance_profile" "tfer--AmazonSSMManaged" {
  name = "AmazonSSMManaged"
  path = "/"
  role = "AmazonSSMManaged"
}

resource "aws_iam_instance_profile" "tfer--Budget-Control" {
  name = "Budget-Control"
  path = "/"
  role = "Budget-Control"
}

resource "aws_iam_instance_profile" "tfer--aws-opsworks-ec2-role" {
  name = "aws-opsworks-ec2-role"
  path = "/"
  role = "aws-opsworks-ec2-role"
}

resource "aws_iam_policy" "tfer--AWSEC2StartStopReboot" {
  name = "AWSEC2StartStopReboot"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:RebootInstances",
        "ec2:StartInstances",
        "ec2:StopInstances"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY  
}

resource "aws_iam_policy" "tfer--CloudFront-Apprendiendo" {
  name = "CloudFront-Apprendiendo"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "cloudfront:CreateInvalidation"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:cloudfront::563337348171:distribution/E27BUQA8Y482SH",
      "Sid": "Stmt1640316205827"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--S3-Apprendiendo" {
  name = "S3-Apprendiendo"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:*",
      "Effect": "Allow",
      "Resource": [
        "arn:aws:s3:::apprendiendo-naza",
        "arn:aws:s3:::apprendiendo-naza/*"
      ],
      "Sid": "Stmt1640307015781"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_policy" "tfer--StopInstance_Production" {
  name = "StopInstance_Production"
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:StopInstances",
        "ec2:StartInstances",
        "ec2:DescribeInstanceStatus"
      ],
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor0"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_role" "tfer--AWSServiceRoleForAmazonSSM" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ssm.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Provides access to AWS Resources managed or used by Amazon SSM."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonSSMServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForAmazonSSM"
  path                 = "/aws-service-role/ssm.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForElasticLoadBalancing" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "elasticloadbalancing.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows ELB to call AWS services on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForElasticLoadBalancing"
  path                 = "/aws-service-role/elasticloadbalancing.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForRDS" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "rds.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows Amazon RDS to manage AWS resources on your behalf"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AmazonRDSServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForRDS"
  path                 = "/aws-service-role/rds.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForSupport" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "support.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Enables resource access for AWS to provide billing, administrative and support services"
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForSupport"
  path                 = "/aws-service-role/support.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AWSServiceRoleForTrustedAdvisor" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "trustedadvisor.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Access for the AWS Trusted Advisor Service to help reduce cost, increase performance, and improve security of your AWS environment."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"]
  max_session_duration = "3600"
  name                 = "AWSServiceRoleForTrustedAdvisor"
  path                 = "/aws-service-role/trustedadvisor.amazonaws.com/"
}

resource "aws_iam_role" "tfer--AmazonSSMManaged" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows EC2 instances to call AWS services on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AmazonRDSFullAccess", "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
  max_session_duration = "3600"
  name                 = "AmazonSSMManaged"
  path                 = "/"

  tags = {
    Server = "Production"
  }


}

resource "aws_iam_role" "tfer--Budget-Control" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows EC2 instances to call AWS services on your behalf."
  managed_policy_arns  = ["arn:aws:iam::aws:policy/AWSBudgetsActionsWithAWSResourceControlAccess"]
  max_session_duration = "3600"
  name                 = "Budget-Control"
  path                 = "/"
}

resource "aws_iam_role" "tfer--StopInstance_Production" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ssm.amazonaws.com"
      },
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows SSM to call AWS services on your behalf"
  managed_policy_arns  = ["arn:aws:iam::563337348171:policy/StopInstance_Production"]
  max_session_duration = "3600"
  name                 = "StopInstance_Production"
  path                 = "/"

  tags = {
    Name = "Production"
  }


}

resource "aws_iam_role" "tfer--StopInstances" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ssm.amazonaws.com"
      },
      "Sid": ""
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Allows SSM to call AWS services on your behalf"
  managed_policy_arns  = ["arn:aws:iam::563337348171:policy/StopInstance_Production"]
  max_session_duration = "3600"
  name                 = "StopInstances"
  path                 = "/"
}

resource "aws_iam_role" "tfer--aws-opsworks-ec2-role" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  max_session_duration = "3600"
  name                 = "aws-opsworks-ec2-role"
  path                 = "/"
}

resource "aws_iam_role" "tfer--aws-opsworks-service-role" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "opsworks.amazonaws.com"
      }
    }
  ],
  "Version": "2008-10-17"
}
POLICY

  inline_policy {
    name   = "aws-opsworks-service-policy"
    policy = "{\"Statement\":[{\"Action\":[\"ec2:*\",\"iam:PassRole\",\"cloudwatch:GetMetricStatistics\",\"cloudwatch:DescribeAlarms\",\"ecs:*\",\"elasticloadbalancing:*\",\"rds:*\"],\"Effect\":\"Allow\",\"Resource\":[\"*\"]}]}"
  }

  max_session_duration = "3600"
  name                 = "aws-opsworks-service-role"
  path                 = "/"
}

resource "aws_iam_role_policy" "tfer--aws-opsworks-service-role_aws-opsworks-service-policy" {
  name = "aws-opsworks-service-policy"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "ec2:*",
        "iam:PassRole",
        "cloudwatch:GetMetricStatistics",
        "cloudwatch:DescribeAlarms",
        "ecs:*",
        "elasticloadbalancing:*",
        "rds:*"
      ],
      "Effect": "Allow",
      "Resource": [
        "*"
      ]
    }
  ]
}
POLICY

  role = "aws-opsworks-service-role"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForAmazonSSM_AmazonSSMServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonSSMServiceRolePolicy"
  role       = "AWSServiceRoleForAmazonSSM"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForElasticLoadBalancing_AWSElasticLoadBalancingServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSElasticLoadBalancingServiceRolePolicy"
  role       = "AWSServiceRoleForElasticLoadBalancing"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForRDS_AmazonRDSServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AmazonRDSServiceRolePolicy"
  role       = "AWSServiceRoleForRDS"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForSupport_AWSSupportServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSSupportServiceRolePolicy"
  role       = "AWSServiceRoleForSupport"
}

resource "aws_iam_role_policy_attachment" "tfer--AWSServiceRoleForTrustedAdvisor_AWSTrustedAdvisorServiceRolePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/aws-service-role/AWSTrustedAdvisorServiceRolePolicy"
  role       = "AWSServiceRoleForTrustedAdvisor"
}

resource "aws_iam_role_policy_attachment" "tfer--AmazonSSMManaged_AmazonRDSFullAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonRDSFullAccess"
  role       = "AmazonSSMManaged"
}

resource "aws_iam_role_policy_attachment" "tfer--AmazonSSMManaged_AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = "AmazonSSMManaged"
}

resource "aws_iam_role_policy_attachment" "tfer--Budget-Control_AWSBudgetsActionsWithAWSResourceControlAccess" {
  policy_arn = "arn:aws:iam::aws:policy/AWSBudgetsActionsWithAWSResourceControlAccess"
  role       = "Budget-Control"
}

resource "aws_iam_role_policy_attachment" "tfer--StopInstance_Production_StopInstance_Production" {
  policy_arn = "arn:aws:iam::563337348171:policy/StopInstance_Production"
  role       = "StopInstance_Production"
}

resource "aws_iam_role_policy_attachment" "tfer--StopInstances_StopInstance_Production" {
  policy_arn = "arn:aws:iam::563337348171:policy/StopInstance_Production"
  role       = "StopInstances"
}

resource "aws_iam_user" "tfer--AIDAYGKMFYRFR44JR5JRA" {
  force_destroy = "false"
  name          = "NAS"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDAYGKMFYRFTISKGSHYK" {
  force_destroy = "false"
  name          = "github"
  path          = "/"
}

resource "aws_iam_user" "tfer--AIDAYGKMFYRFV6HMQOZ42" {
  force_destroy = "false"
  name          = "eAnselmi"
  path          = "/"

  tags = {
    Proyecto = "Apprendiendo"
  }


}

resource "aws_iam_user_group_membership" "tfer--NAS-002F-S3" {
  groups = ["S3"]
  user   = "NAS"
}

resource "aws_iam_user_group_membership" "tfer--eAnselmi-002F-Admin" {
  groups = ["Admin"]
  user   = "eAnselmi"
}



resource "aws_iam_user_policy_attachment" "tfer--github_CloudFront-Apprendiendo" {
  policy_arn = "arn:aws:iam::563337348171:policy/CloudFront-Apprendiendo"
  user       = "github"
}

resource "aws_iam_user_policy_attachment" "tfer--github_S3-Apprendiendo" {
  policy_arn = "arn:aws:iam::563337348171:policy/S3-Apprendiendo"
  user       = "github"
}

resource "aws_instance" "tfer--i-003729745a7d7dc9c_" {
  ami                         = "ami-0aeeebd8d2ab47354"
  associate_public_ip_address = "false"
  availability_zone           = "us-east-1a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count       = "1"
  cpu_threads_per_core = "1"

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  iam_instance_profile                 = "AmazonSSMManaged"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = "0"
  key_name                             = "Apprendiendo"

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring = "false"
  private_ip = "10.0.2.10"

  root_block_device {
    delete_on_termination = "false"
    encrypted             = "false"

    #tags = var.tags
    tags = merge(var.tags,
      {
        Name = "Backend_EBS"
    })

    volume_size = "8"
    volume_type = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-02cb4bb032092bb77_id

  tags = {
    Name = "Backend"
  }



  tenancy                = "default"
  vpc_security_group_ids = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--default_sg-06ae9d0ab7fd61763_id}"]
}

resource "aws_instance" "tfer--i-0daede25a7b2653da_" {
  ami                         = "ami-07d59cc313c47b199"
  associate_public_ip_address = "false"
  availability_zone           = "us-east-1a"

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_core_count       = "1"
  cpu_threads_per_core = "1"

  credit_specification {
    cpu_credits = "standard"
  }

  disable_api_termination = "false"
  ebs_optimized           = "false"

  enclave_options {
    enabled = "false"
  }

  get_password_data                    = "false"
  hibernation                          = "false"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = "0"
  key_name                             = "Apprendiendo"

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = "1"
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  monitoring = "false"
  private_ip = "10.0.1.10"

  root_block_device {
    delete_on_termination = "false"
    encrypted             = "false"

    tags = var.tags

    volume_size = "1"
    volume_type = "gp2"
  }

  source_dest_check = "false"
  subnet_id         = data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0b509a1c548112f21_id

  tags = {
    Name = "Mikrotik"
  }



  tenancy                = "default"
  vpc_security_group_ids = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--default_sg-06ae9d0ab7fd61763_id}"]
}

resource "aws_internet_gateway" "tfer--igw-0c1a2115a274b2f48" {
  vpc_id = data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-0a959fbbb6e218290_id
}


resource "aws_main_route_table_association" "tfer--vpc-0a959fbbb6e218290" {
  route_table_id = data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-0abbaa5aba0c1094c_id
  vpc_id         = data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-0a959fbbb6e218290_id
}

resource "aws_network_acl" "tfer--acl-04f6162eaf30696f4" {
  egress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  ingress {
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = "0"
    icmp_code  = "0"
    icmp_type  = "0"
    protocol   = "-1"
    rule_no    = "100"
    to_port    = "0"
  }

  subnet_ids = ["${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-02cb4bb032092bb77_id}", "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0b509a1c548112f21_id}", "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0e577e9cdf572d8ca_id}"]
  vpc_id     = data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-0a959fbbb6e218290_id
}

resource "aws_network_interface" "tfer--eni-04acfd53fcefbe352" {
  attachment {
    device_index = "0"
    instance     = "i-0daede25a7b2653da"
  }

  description        = "Primary network interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.0.1.10"
  private_ips        = ["10.0.1.10"]
  security_groups    = ["sg-06ae9d0ab7fd61763"]
  source_dest_check  = "false"
  subnet_id          = "subnet-0b509a1c548112f21"
}



resource "aws_network_interface" "tfer--eni-0aa5583a058e60ba7" {
  description        = "RDSNetworkInterface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.0.2.195"
  private_ips        = ["10.0.2.195"]
  security_groups    = ["sg-0a846758c5cf449b9"]
  source_dest_check  = "true"
  subnet_id          = "subnet-02cb4bb032092bb77"
}

resource "aws_network_interface" "tfer--eni-0d43eb18190a681a3" {
  attachment {
    device_index = "0"
    instance     = "i-003729745a7d7dc9c"
  }

  description        = "Primary network interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.0.2.10"
  private_ips        = ["10.0.2.10"]
  security_groups    = ["sg-06ae9d0ab7fd61763"]
  source_dest_check  = "true"
  subnet_id          = "subnet-02cb4bb032092bb77"
}

resource "aws_opsworks_user_profile" "tfer--arn-003A-aws-003A-iam-003A--003A-563337348171-003A-root" {
  allow_self_management = "false"
  ssh_username          = "not-root"
  user_arn              = "arn:aws:iam::563337348171:root"
}

resource "aws_opsworks_user_profile" "tfer--arn-003A-aws-003A-iam-003A--003A-563337348171-003A-user-002F-eAnselmi" {
  allow_self_management = "false"
  ssh_username          = "eanselmi"
  user_arn              = "arn:aws:iam::563337348171:user/eAnselmi"
}

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

resource "aws_route_table" "tfer--rtb-07e03d8de796b4a3b" {
  route {
    cidr_block           = "0.0.0.0/0"
    instance_id          = "i-0daede25a7b2653da"
    network_interface_id = "eni-04acfd53fcefbe352"
  }
  vpc_id = data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-0a959fbbb6e218290_id
}

resource "aws_route_table" "tfer--rtb-0abbaa5aba0c1094c" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0c1a2115a274b2f48"
  }
  vpc_id = data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-0a959fbbb6e218290_id
}



resource "aws_route_table_association" "tfer--subnet-02cb4bb032092bb77" {
  route_table_id = data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-07e03d8de796b4a3b_id
  subnet_id      = data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-02cb4bb032092bb77_id
}

resource "aws_route_table_association" "tfer--subnet-0b509a1c548112f21" {
  route_table_id = data.terraform_remote_state.local.outputs.aws_route_table_tfer--rtb-0abbaa5aba0c1094c_id
  subnet_id      = data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0b509a1c548112f21_id
}





resource "aws_security_group" "tfer--RDS-Apprendiendo_sg-0a846758c5cf449b9" {
  description = "Created by RDS management console"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "3306"
    protocol    = "tcp"
    self        = "false"
    to_port     = "3306"
  }

  name = "RDS-Apprendiendo"

  tags = {
    Name = "RDS_SG"
  }



  vpc_id = "vpc-0a959fbbb6e218290"
}

resource "aws_security_group" "tfer--default_sg-06ae9d0ab7fd61763" {
  description = "default VPC security group"

  egress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name = "default"

  tags = {
    Name = "Default_SG"
  }
  vpc_id = "vpc-0a959fbbb6e218290"
}



resource "aws_subnet" "tfer--subnet-02cb4bb032092bb77" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.2.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Private_Subnet_10.0.2.0/24"
  }



  vpc_id = data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-0a959fbbb6e218290_id
}

resource "aws_subnet" "tfer--subnet-0b509a1c548112f21" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.1.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Public_Subnet_10.0.1.0/24"
  }



  vpc_id = data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-0a959fbbb6e218290_id
}

resource "aws_subnet" "tfer--subnet-0e577e9cdf572d8ca" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.0.8.0/24"
  enable_dns64                                   = "false"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Private_Subnet_10.0.8.0/24"
  }

  vpc_id = data.terraform_remote_state.local.outputs.aws_vpc_tfer--vpc-0a959fbbb6e218290_id
}

resource "aws_vpc" "tfer--vpc-0a959fbbb6e218290" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "10.0.0.0/16"
  enable_classiclink               = "false"
  enable_classiclink_dns_support   = "false"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"

  tags = {
    Name = "Apprendiendo"
  }


}
