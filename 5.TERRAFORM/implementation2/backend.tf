terraform {
  backend "s3" {
    bucket = "terraform-state-bucket354200"
    key    = "dev/project/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-locks354200"
    encrypt = true
  }
}