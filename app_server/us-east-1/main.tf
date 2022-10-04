terraform {
  backend "s3" {
    bucket = "jaws1-tf-state"
    key    = "fbsd13-webstack/us-east-1/app-server"
    region = "us-east-1"  # region is where the bucket lives, not the managed resources
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}
