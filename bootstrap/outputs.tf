output "terraform_state_bucket" {
  description = "Terraform remote state bucket"
  value       = aws_s3_bucket.terraform_state.bucket
}


output "terraform_plan_artifact_bucket" {
  description = "Terraform plan artifact bucket"
  value       = aws_s3_bucket.terraform_plan_artifacts.bucket
}



