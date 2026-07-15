resource "aws_eks_cluster" "this" {

  name = var.cluster_name

  version = var.kubernetes_version


  role_arn = var.cluster_role_arn


  vpc_config {

    subnet_ids = var.private_subnet_ids


    endpoint_private_access = true

    endpoint_public_access = true

  }


  encryption_config {

    provider {

      key_arn = var.kms_key_arn

    }

    resources = [
      "secrets"
    ]

  }


  tags = {

    Environment = var.environment

    Terraform = "true"

  }

}
# OIDC Provider for IRSA
#

data "tls_certificate" "eks" {

  url = aws_eks_cluster.this.identity[0].oidc[0].issuer

}



resource "aws_iam_openid_connect_provider" "this" {

  client_id_list = [
    "sts.amazonaws.com"
  ]


  thumbprint_list = [
    data.tls_certificate.eks.certificates[0].sha1_fingerprint
  ]


  url = aws_eks_cluster.this.identity[0].oidc[0].issuer

}
