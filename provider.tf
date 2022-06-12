provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

terraform {
  cloud {
    organization = "eanselmi"
    workspaces {
      name = "Apprendiendo"
    }
  }
  required_providers {
    aws = {
      version = "~> 3.75.1"
    }
  }
}
