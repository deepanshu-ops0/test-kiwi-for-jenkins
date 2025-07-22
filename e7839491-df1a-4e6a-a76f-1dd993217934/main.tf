terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "deepanshu_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_ownership_controls" "deepanshu_bucket_ownership" {
  bucket = aws_s3_bucket.deepanshu_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}