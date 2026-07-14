# Trust policy for EKS Control Plane
data "aws_iam_policy_document" "eks_cluster_assume_role" {

  statement {

    effect = "Allow"

    principals {

      type = "Service"

      identifiers = [
        "eks.amazonaws.com"
      ]

    }

    actions = [
      "sts:AssumeRole"
    ]

  }

}
# IAM Role for EKS Cluster
resource "aws_iam_role" "eks_cluster_role" {

  name = "${var.cluster_name}-${var.environment}-cluster-role"

  assume_role_policy = data.aws_iam_policy_document.eks_cluster_assume_role.json

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}

# Attach AmazonEKSClusterPolicy
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {

  role = aws_iam_role.eks_cluster_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Attach AmazonEKSVPCResourceController
resource "aws_iam_role_policy_attachment" "eks_vpc_controller" {

  role = aws_iam_role.eks_cluster_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}
