variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform state"
  type        = string
  default     = "terraform-state-bucket354200"
}

variable "lock_table_name" {
  description = "Name of the DynamoDB table for Terraform locks"
  type        = string
  default     = "terraform-locks354200"
}

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}