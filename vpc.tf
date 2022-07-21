resource "aws_vpc" "apprendiendo_vpc" {
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

resource "aws_subnet" "public_subnet" {
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
  vpc_id = aws_vpc.apprendiendo_vpc.id
}

resource "aws_subnet" "private_subnet_backend" {
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
  vpc_id = aws_vpc.apprendiendo_vpc.id
}

resource "aws_subnet" "private_subnet_unused" {
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
  vpc_id = aws_vpc.apprendiendo_vpc.id
}

resource "aws_internet_gateway" "apprendiendi_igw" {
  vpc_id = aws_vpc.apprendiendo_vpc.id
}

resource "aws_main_route_table_association" "default_rt" {
  route_table_id = aws_route_table.public_rt.id
  vpc_id         = aws_vpc.apprendiendo_vpc.id
}

resource "aws_network_acl" "default_nacl" {
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

  subnet_ids = [aws_subnet.private_subnet_backend.id, aws_subnet.public_subnet.id, aws_subnet.private_subnet_unused.id]

  vpc_id = aws_vpc.apprendiendo_vpc.id
}

resource "aws_route_table" "private_backend_crt" {
  route {
    cidr_block           = "0.0.0.0/0"
    network_interface_id = aws_network_interface.apprendiendo_mikrotik_eni.id
  }
  vpc_id = aws_vpc.apprendiendo_vpc.id
}

resource "aws_route_table" "public_rt" {
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0c1a2115a274b2f48"
  }
  vpc_id = aws_vpc.apprendiendo_vpc.id
}


resource "aws_route_table_association" "rta_private_subnet_backend" {
  route_table_id = aws_route_table.private_backend_crt.id
  subnet_id      = aws_subnet.private_subnet_backend.id
}

resource "aws_route_table_association" "rta_public_subnet" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet.id
}


resource "aws_security_group" "sg_default" {
  description = "default VPC security group"

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
    from_port   = "0"
    protocol    = "-1"
    self        = "false"
    to_port     = "0"
  }

  name = "default"
  tags = {
    Name = "Default_SG"
  }
  vpc_id = aws_vpc.apprendiendo_vpc.id
}
