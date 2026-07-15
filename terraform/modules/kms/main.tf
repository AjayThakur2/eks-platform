resource "aws_kms_key" "eks" {

  description = "KMS key for EKS secrets encryption"

  enable_key_rotation = true


  tags = {

    Name = "${var.cluster_name}-eks-secrets-key"

    Environment = var.environment

    Terraform = "true"

  }

}


resource "aws_kms_alias" "eks" {

  name = "alias/${var.cluster_name}-eks"

  target_key_id = aws_kms_key.eks.key_id

}
