provider "aws" {
    profile = "aws_profile"
    region = "eu-west-1"
}

terraform {
  required_providers {
    sops = {
      source = "carlpett/sops"
      version = "~> 0.5"
    }
  }
}

data "sops_file" "sops_secret" {
  source_file = "secrets.json"
}

