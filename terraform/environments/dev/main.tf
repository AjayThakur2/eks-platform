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


module "vpc" {
  source = "../../modules/vpc"

  name        = var.cluster_name
  environment = var.environment

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  private_subnet_cidrs = var.private_subnet_cidrs
}
module "iam" {
  source = "../../modules/iam"

  cluster_name = var.cluster_name
  environment  = var.environment
}
#EKS Cluster Add
module "eks" {

  source = "../../modules/eks"


  cluster_name = "eks-platform-dev"


  kubernetes_version = "1.32"


  cluster_role_arn = module.iam.cluster_role_arn


  private_subnet_ids = module.vpc.private_subnet_ids


  kms_key_arn = module.kms.kms_key_arn


  environment = "dev"
}
# KMS Module Added
module "kms" {

  source = "../../modules/kms"


  cluster_name = "eks-platform-dev"


  environment = "dev"

}
#Adding Node_Group
module "node_group" {

  source = "../../modules/node-group"


  cluster_name = module.eks.cluster_name


  node_group_name = "eks-platform-dev-ng"


  node_role_arn = module.iam.node_role_arn


  private_subnet_ids = module.vpc.private_subnet_ids


  environment = var.environment

}
