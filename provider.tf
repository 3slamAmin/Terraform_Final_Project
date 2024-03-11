# Configure the provider software version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "../creds.txt"
}
provider "aws" {
  region                  = "us-west-2"
  alias                   = "r2"
  shared_credentials_file = "../creds.txt"
}