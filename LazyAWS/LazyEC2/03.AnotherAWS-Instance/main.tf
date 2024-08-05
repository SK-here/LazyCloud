# First Terraform instance 
# @Author: Saksham (SK) Trivedi

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {

  ami           = "ami-0ba9883b710b05ac6" # updated ami
#  ami           = "ami-04a81a99f5ec58529"  # Old AMI
  instance_type = "t2.micro"

  tags = {
    Name = "TestServerInstance"
  }
}
