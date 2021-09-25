terraform {
  required_version = "~> 1.0"
  required_providers {
      aws = {
          source = "hashicorp/aws"
          version = "~> 3.0" # Optional but recommended
      }

      null = {
        source = "hashicorp/null"
        version = "~> 3.1.0"
      }
  }
}

# Provider Block
provider "aws" {
  profile = "default"
  region = var.aws_region
}