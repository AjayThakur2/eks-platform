terraform {
  backend "s3" {
    bucket       = "eks-platform-dev-tf-state-952969969207"
    key          = "bootstrap/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}
