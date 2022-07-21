# resource "aws_db_instance" "tfer--apprendiendo" {
#   allocated_storage                     = "20"
#   auto_minor_version_upgrade            = "true"
#   availability_zone                     = "us-east-1a"
#   backup_retention_period               = "7"
#   backup_window                         = "03:07-03:37"
#   ca_cert_identifier                    = "rds-ca-2019"
#   copy_tags_to_snapshot                 = "true"
#   customer_owned_ip_enabled             = "false"
#   db_subnet_group_name                  = aws_db_subnet_group.tfer--default-vpc-0a959fbbb6e218290.name
#   deletion_protection                   = "false"
#   engine                                = "mysql"
#   engine_version                        = "8.0.23"
#   iam_database_authentication_enabled   = "true"
#   identifier                            = "apprendiendo"
#   instance_class                        = "db.t2.micro"
#   iops                                  = "0"
#   license_model                         = "general-public-license"
#   maintenance_window                    = "wed:04:14-wed:04:44"
#   max_allocated_storage                 = "0"
#   monitoring_interval                   = "0"
#   multi_az                              = "false"
#   option_group_name                     = "default:mysql-8-0"
#   parameter_group_name                  = "default.mysql8.0"
#   performance_insights_enabled          = "false"
#   performance_insights_retention_period = "0"
#   port                                  = "3306"
#   publicly_accessible                   = "false"
#   storage_encrypted                     = "false"
#   storage_type                          = "gp2"

#   tags = {
#     Name = "Apprendiendo_DB"
#   }
#   username               = "admin"
#   vpc_security_group_ids = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--RDS-Apprendiendo_sg-0a846758c5cf449b9_id}"]
# }

# resource "aws_db_subnet_group" "tfer--default-vpc-0a959fbbb6e218290" {
#   description = "Created from the RDS Management Console"
#   name        = "default-vpc-0a959fbbb6e218290"
#   subnet_ids  = ["${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-02cb4bb032092bb77_id}", "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0b509a1c548112f21_id}", "${data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0e577e9cdf572d8ca_id}"]
# }

# resource "aws_docdb_subnet_group" "tfer--default-vpc-0a959fbbb6e218290" {
#   description = "Created from the RDS Management Console"
#   name        = "default-vpc-0a959fbbb6e218290"
#   subnet_ids  = ["subnet-02cb4bb032092bb77", "subnet-0b509a1c548112f21", "subnet-0e577e9cdf572d8ca"]
# }

# resource "aws_network_interface" "tfer--eni-0aa5583a058e60ba7" {
#   description        = "RDSNetworkInterface"
#   ipv4_prefix_count  = "0"
#   ipv6_address_count = "0"
#   ipv6_prefix_count  = "0"
#   private_ip         = "10.0.2.195"
#   private_ips        = ["10.0.2.195"]
#   security_groups    = ["sg-0a846758c5cf449b9"]
#   source_dest_check  = "true"
#   subnet_id          = "subnet-02cb4bb032092bb77"
# }

resource "aws_security_group" "tfer--RDS-Apprendiendo_sg-0a846758c5cf449b9" {
  description = "Created by RDS management console"

  egress {
    description = "Allow egress traffic"
    #tfsec:ignore:aws-vpc-no-public-egress-sgr
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  ingress {
    #tfsec:ignore:aws-vpc-no-public-ingress-sgr
    description = "Allow inbound traffic"
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
