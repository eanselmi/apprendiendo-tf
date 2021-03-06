resource "aws_instance" "apprendiendo_backend" {
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
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring = "false"
  private_ip = "10.0.2.10"

  root_block_device {
    delete_on_termination = "false"
    encrypted             = "false"
    tags = merge(var.tags,
      {
        Name = "Backend_EBS"
    })
    volume_size = "8"
    volume_type = "gp2"
  }

  source_dest_check = "true"
  subnet_id         = aws_subnet.private_subnet_backend.id

  tags = {
    Name = "Backend"
  }
  tenancy                = "default"
  vpc_security_group_ids = [aws_security_group.sg_default.id]
}

resource "aws_instance" "apprendiendo_mikrotik" {
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
    http_tokens                 = "required"
    instance_metadata_tags      = "disabled"
  }

  monitoring = "false"
  private_ip = "10.0.1.10"

  root_block_device {
    delete_on_termination = "false"
    encrypted             = "false"

    tags = merge(var.tags,
      {
        Name = "Mikrotik_EBS"
    })

    volume_size = "1"
    volume_type = "gp2"
  }

  source_dest_check = "false"
  subnet_id         = aws_subnet.public_subnet.id

  tags = {
    Name = "Mikrotik"
  }
  tenancy                = "default"
  vpc_security_group_ids = [aws_security_group.sg_default.id]
}

resource "aws_network_interface" "apprendiendo_mikrotik_eni" {
  attachment {
    device_index = "0"
    instance     = aws_instance.apprendiendo_mikrotik.id
  }

  description        = "Primary network interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.0.1.10"
  private_ips        = ["10.0.1.10"]
  security_groups    = [aws_security_group.sg_default.id]
  source_dest_check  = "false"
  subnet_id          = aws_subnet.public_subnet.id
}

resource "aws_network_interface" "apprendiendo_backend_eni" {
  attachment {
    device_index = "0"
    instance     = aws_instance.apprendiendo_backend.id
  }

  description        = "Primary network interface"
  ipv4_prefix_count  = "0"
  ipv6_address_count = "0"
  ipv6_prefix_count  = "0"
  private_ip         = "10.0.2.10"
  private_ips        = ["10.0.2.10"]
  security_groups    = [aws_security_group.sg_default.id]
  source_dest_check  = "true"
  subnet_id          = aws_subnet.private_subnet_backend.id
}
