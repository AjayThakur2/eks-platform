
terraform {
  backend "s3" {
    bucket         = "eks-platform-dev-tf-state-952969969207"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-platform-dev-tf-locks"
    encrypt        = true
  }
}
