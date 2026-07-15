output "terraform_state_bucket" {
  description = "Terraform remote state bucket"
  value       = aws_s3_bucket.terraform_state.bucket
}


output "terraform_plan_artifact_bucket" {
  description = "Terraform plan artifact bucket"
  value       = aws_s3_bucket.terraform_plan_artifacts.bucket
}


output "terraform_lock_table" {
  description = "Terraform state lock DynamoDB table"
  value       = aws_dynamodb_table.terraform_lock.name
}
