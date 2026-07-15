output "cluster_role_arn" {
  description = "IAM role ARN assumed by EKS control plane"
  value       = aws_iam_role.eks_cluster_role.arn
}
output "node_role_arn" {
  description = "IAM role ARN attached to EKS worker nodes"
  value       = aws_iam_role.eks_node_role.arn
}
