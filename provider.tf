terraform {
  required_version = ">=1.1.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.32.0"
    }
  }
}

provider "aws" {
  region = var.region

}