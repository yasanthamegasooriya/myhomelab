terraform {
  required_providers {
    aws ={
        source  = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket  = "yasanthaterraformlab"
    key     = "mylab/terraform.tfstate"
    encrypt = true
    region  = "us-east-1"
    profile = "yasanthaterraformlab"
  }
}

provider "aws" {
  region = "us-east-1"
  profile = "yasanthaterraformlab"
}