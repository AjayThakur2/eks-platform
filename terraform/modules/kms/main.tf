resource "aws_kms_key" "eks_secrets" {

  description = "KMS key for EKS secrets encryption"

  enable_key_rotation = true


  tags = {

    Name = "${var.cluster_name}-eks-secrets-key"

    Environment = var.environment

    Terraform = "true"

  }

}


resource "aws_kms_alias" "eks_secrets" {

  name = "alias/${var.cluster_name}-eks-secrets"

  target_key_id = aws_kms_key.eks_secrets.key_id

}


resource "aws_kms_key" "ebs" {

  description = "KMS key for EKS worker node EBS encryption"

  enable_key_rotation = true


  tags = {

    Name = "${var.cluster_name}-eks-ebs-key"

    Environment = var.environment

    Terraform = "true"

  }

}


resource "aws_kms_alias" "ebs" {

  name = "alias/${var.cluster_name}-eks-ebs"

  target_key_id = aws_kms_key.ebs.key_id

}
