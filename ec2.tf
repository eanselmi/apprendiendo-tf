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
  subnet_id         = data.terraform_remote_state.local.outputs.aws_subnet_tfer--subnet-0b509a1c548112f21_id

  tags = {
    Name = "Mikrotik"
  }
  tenancy                = "default"
  vpc_security_group_ids = ["${data.terraform_remote_state.local.outputs.aws_security_group_tfer--default_sg-06ae9d0ab7fd61763_id}"]
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
