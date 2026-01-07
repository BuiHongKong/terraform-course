terraform {
  required_version = ">= 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}



resource "aws_s3_bucket" "my_bucket" {
  bucket = "some-random-bucket-name-aosdhfoadhfu"
}

