variable "cluster_name" {

  type = string

}


variable "kubernetes_version" {

  type = string

  default = "1.32"

}


variable "cluster_role_arn" {

  type = string

}


variable "private_subnet_ids" {

  type = list(string)

}


variable "kms_key_arn" {

  type = string

}


variable "environment" {

  type = string

}

variable "eks_admin_principal_arns" {

  description = "IAM principals with EKS admin access"

  type = list(string)

  default = []

}
