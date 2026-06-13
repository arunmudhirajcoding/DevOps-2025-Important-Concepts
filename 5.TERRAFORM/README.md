#  TERRAFORM
- This directory contains Terraform configuration files for provisioning and managing cloud infrastructure. Terraform is an open-source Infrastructure as Code (IaC) tool that allows you to define and provide data center infrastructure using a high-level configuration language.
- cloud infrastructure like AWS, Azure, GCP, and more.

## Installation of Terraform 
- go to hashcrop terraform website
- extract terraform in a new folder in ur local machine, based on ur proccessor
- to know ur processor in windows 
```powershell
systeminfo | findstr /B /C:"System Type"
```
- add path to environment variables
- verify by 
```bash
terraform --version
```

## Terraform terminologies 
- provider - which cloud service to use Eg: AWS,GCP etc
- Resource - what to create Eg: EC2 instance, S3 bucket etc
- Variable - input values for configuration
- Module - reusable blocks of configuration
- Output - output values from configuration
- State - current state of infrastructure
- Plan - preview of changes to be made
- Apply - apply the changes
- Destroy - destroy the infrastructure

## Worfklow of Terraform
**Step 1:** Make a .tf file and write your
Terraform code
```tf
provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-fodsn837974hfffd" # based on region ami id will change
    instance_type = "t3.micro"
    tags = {
        Name = "TeffaformEC2"
    }
}
```

**Step 2:** Run terraform init → to set up the
project
```bash
terraform init
```

**Step 3:** Run terraform plan → to preview
what will be created
```bash
terraform plan
```

**Step 4:** Run terraform apply → to create the
resources
```bash
terraform apply
```

**Step 5:** (Optional) Run terraform destroy →
to delete everything
```bash
terraform destroy
```

**Note**: without AWS cli configuration, terraform do nothing


## working with terraform
- create main.tf, variables.tf, outputs.tf
- in main.tf
```h
provider "aws" {
  region = var.aws_region #region variable
}

data "aws_ami" "amazon_linux" {
  most_recent = true # get latest version
  owners = ["amazon"] # which resource

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"] #version of amazon linux
  }
}

resource "aws_instance" "my_ec2" {
  ami = data.aws_ami.amazon_linux.id # ami id
  instance_type = var.instance_type # type of instance

  tags = {
    Name = var.instance_name # name of instance
  }
}
```
- define variables in variables.tf
```h
variable "aws_region" {
  description = "AWS region"
  type = string
  default = "ap-south-1"
}

variable "instance_type" {
  description = "Instance type"
  type = string
  default = "t3.micro"
}

variable "instance_name" {
  description = "Instance name"
  type = string
  default = "TerraformEC2"
}
```
- define outputs in outputs.tf 
```h
output "instance_id" {
  description = "Instance ID"
  value = aws_instance.my_ec2.id
}
```

## Terraform workspaces
```bash
terraform workspace list
```

```bash
terraform workspace new dev
```
- to switch between workspace
```bash
terraform workspace select dev
```

# for more terraform implementation examples
check `implementation2` folder