provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "myec2" {
    ami = "ami-0685bcc683daggdrb9" # based on region ami id will change
    instance_type = "t3.micro"
    tags = {
        Name = "TeffaformEC2"
    }
}
