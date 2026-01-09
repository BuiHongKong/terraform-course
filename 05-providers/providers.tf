terraform {
  required_version = "~> 1.7"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}

resource "aws_s3_bucket" "ap_southeast_1" {
  bucket = "some-random-bucket-name-aosdhfoadhfu"
}

resource "aws_s3_bucket" "ap_southeast_1" {
  bucket   = "some-random-bucket-name-18736481364"
  provider = aws.ap_southeast_1
}