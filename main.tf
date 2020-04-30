terraform {
  backend "s3" {
    bucket         = "smbaligh-tf-global-state"
    dynamodb_table = "tf-global-lock"
    encrypt        = true
    key            = "terraform/terraform.tfstate"
    region         = "us-east-2"
  }
}

#
provider "aws" {
  version = "~> 2.59"
  region  = "us-east-1"
  profile = "personal"
}
