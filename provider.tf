provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
    tags = var.tags
  }
}

terraform {
  cloud {
    organization = "eanselmi"
    workspaces {
      name = "Apprendiendo"
    }
  }
  required_version = "1.2.5"
  required_providers {
    aws = {
      version = "~> 4"
    }
  }
}
