terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = var.aws_region
}


resource "aws_s3_bucket" "terraform_state" {
  bucket = var.state_bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name      = "Terraform State"
    ManagedBy = "Terraform"
  }
}


resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}


#Dev-terraform_plan_artifacts_S3
resource "aws_s3_bucket" "terraform_plan_artifacts" {

  bucket = var.plan_artifact_bucket_name

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name      = "Terraform Plan Artifacts"
    ManagedBy = "Terraform"
  }
}
resource "aws_s3_bucket_versioning" "terraform_plan_artifacts" {

  bucket = aws_s3_bucket.terraform_plan_artifacts.id

  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_plan_artifacts" {

  bucket = aws_s3_bucket.terraform_plan_artifacts.id

  rule {

    apply_server_side_encryption_by_default {

      sse_algorithm = "AES256"

    }

  }
}

resource "aws_s3_bucket_public_access_block" "terraform_plan_artifacts" {

  bucket = aws_s3_bucket.terraform_plan_artifacts.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_s3_bucket_lifecycle_configuration" "terraform_plan_artifacts" {

  bucket = aws_s3_bucket.terraform_plan_artifacts.id

  rule {

    id     = "delete-old-plan-files"
    status = "Enabled"
    filter {}
    expiration {
      days = 1
    }

  }

}
