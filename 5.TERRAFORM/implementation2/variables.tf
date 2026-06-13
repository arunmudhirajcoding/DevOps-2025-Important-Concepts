variable "aws_region" {
  description = "The AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "The name tag for the EC2 instance"
  type        = string
  default     = "my-ec2-instance"
}

variable "bucket_name" {
  default = "my-bucket-terraform-354208"
}