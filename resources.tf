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


