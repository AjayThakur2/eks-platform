output "cluster_name" {

  value = aws_eks_cluster.this.name

}


output "endpoint" {

  value = aws_eks_cluster.this.endpoint

}


output "certificate_authority" {

  value = aws_eks_cluster.this.certificate_authority

}
output "oidc_issuer" {

  value = aws_eks_cluster.this.identity[0].oidc[0].issuer

}


output "oidc_provider_arn" {

  value = aws_iam_openid_connect_provider.this.arn

}
