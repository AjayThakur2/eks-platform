variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}
variable "vpc_cidr" {
  description = "VPC CIDR range"
  type        = string
}

variable "availability_zones" {
  description = "AWS Availability Zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR ranges"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR ranges"
  type        = list(string)
}
variable "eks_admin_principal_arns" {

  description = "IAM principals allowed to administer EKS cluster"

  type = list(string)

}
