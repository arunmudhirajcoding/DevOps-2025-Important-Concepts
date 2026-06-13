# provider "aws" {
#   region = var.aws_region # region name
# }

# data "aws_ami" "amazon_linux" {
#   most_recent = true # get latest version
#   owners = ["amazon"] # which resource

#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"] # version of amazon linux
#   }
# }

# resource "aws_instance" "my_ec2" {
#   ami = data.aws_ami.amazon_linux.id # id of ami
#   instance_type = var.instance_type # type of instance

#   tags = {
#     Name = var.instance_name # name of instance
#   }
# }


# conditional Expressions and locals
# provider "aws" {
#   region = var.aws_region # region name
# }

# data "aws_ami" "amazon_linux" {
#   most_recent = true # get latest version
#   owners = ["amazon"] # which resource

#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"] # version of amazon linux
#   }
# }
# locals {
#   name_tag = var.instance_type == "t3.micro" ? "Micro instance" : "Standard Instance"
# }

# resource "aws_instance" "my_ec2" {
#   ami = data.aws_ami.amazon_linux.id # id of ami
#   instance_type = var.instance_type # type of instance

#   tags = {
#     Name = local.name_tag # name of instance
#   }
# }

# Resource dependency
# provider "aws" {
#   region = var.aws_region # region name
# }

# data "aws_ami" "amazon_linux" {
#   most_recent = true # get latest version
#   owners = ["amazon"] # which resource

#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"] # version of amazon linux
#   }
# }
# locals {
#   name_tag = var.instance_type == "t3.micro" ? "Micro instance" : "Standard Instance"
# }

# resource "aws_s3_bucket" "my_s3_bucket" {
#   bucket = var.bucket_name
#   tags = {
#     Name = "My S3 Bucket"
#   }
# }

# resource "aws_instance" "my_ec2" {
#   ami = data.aws_ami.amazon_linux.id # id of ami
#   instance_type = var.instance_type # type of instance

#   tags = {
#     Name = local.name_tag # name of instance
#   }

#   depends_on = [ aws_s3_bucket.my_s3_bucket ] # dependency
# }

# modules

# provider "aws" {
#   region = var.aws_region # region name
# }



# data "aws_ami" "amazon_linux" {
#   most_recent = true # get latest version
#   owners = ["amazon"] # which resource

#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"] # version of amazon linux
#   }
# }

# module "ec2_instance" {
#   source = "./ec2-module"
#   ami = data.aws_ami.amazon_linux.id
#   instance_type = var.instance_type
#   name = "my-ec2-instance"
# }

# workspace
# provider "aws" {
#   region = var.aws_region # region name
# }

# data "aws_ami" "amazon_linux" {
#   most_recent = true # get latest version
#   owners = ["amazon"] # which resource

#   filter {
#     name = "name"
#     values = ["amzn2-ami-hvm-*-x86_64-gp2"] # version of amazon linux
#   }
# }

# resource "aws_instance" "my_ec2" {
#   ami = data.aws_ami.amazon_linux.id # id of ami

#   instance_type = var.instance_type # type of instance

#   tags = {
#     Name = "EC2-${terraform.workspace}" 
#     Environment = terraform.workspace
#   }
# }


# terraform registry

# provider "aws" {
#   region = var.aws_region
# }

# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "my-vpc-terraform"
#   cidr = "10.0.0.0/16" # ip address range

#   azs             = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

#   enable_nat_gateway = true # nat allow private resources
#   enable_vpn_gateway = true

#   tags = {
#     Terraform = "true"
#     Environment = "dev"
#   }
# }


# Remote state with s3 + locking with DynamoDB
provider "aws" {
  region = var.aws_region # region name
}

data "aws_ami" "amazon_linux" {
  most_recent = true # get latest version
  owners = ["amazon"] # which resource

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] # version of amazon linux
  }
}

resource "aws_instance" "my_ec2" {
  ami = data.aws_ami.amazon_linux.id # id of ami

  instance_type = var.instance_type # type of instance

  tags = {
    Name = "ArunRemoteStateEC2"
    
  }
}
