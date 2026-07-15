variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "state_bucket_name" {
  description = "S3 bucket for Terraform state"
  type        = string
}

variable "lock_table_name" {
  description = "DynamoDB table for Terraform locking"
  type        = string
}
variable "plan_artifact_bucket_name" {
  description = "S3 bucket for storing Terraform plan artifacts"
  type        = string
}
