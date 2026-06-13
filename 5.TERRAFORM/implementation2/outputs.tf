# output "instance_public_ip" {
#   value = aws_instance.my_ec2.public_ip
# }

# conditional Expressions and locals
# output "instance_name_tag" {
#   value = local.name_tag
# }

# Depend on
# output "bucket_name" {
#   value = aws_s3_bucket.my_s3_bucket.id
# }


# workspaces
output "workspace_name" {
  value = terraform.workspace
}