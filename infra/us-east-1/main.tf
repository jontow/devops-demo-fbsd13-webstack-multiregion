terraform {
  backend "s3" {
    bucket = "jaws1-tf-state"
    key    = "fbsd13-webstack/us-east-1/infra"
    region = "us-east-1"
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}
