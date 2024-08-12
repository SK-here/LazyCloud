# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Variable declarations

# Vaiable for AWS Region
variable "aws_region" {
  description = "AWS region"
  type = string
  default = "us-east-1"
}

# Value for CIDR
variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type = string
  default = "10.0.0.0/16"
}

# Instance Count
variable "instance_count" {
  description = "Number of provisioned instances"
  type = number
  default = 2
}

# Enable VPN Gateway
variable "enable_vpn_gateway" {
  description = "Enable VPN Gateway in VPC"
  type = bool
  default = false
}

###################### List Of PUBLIC & Private Subnets ########################
# Other than simple variables that we've been using till now TF also supports below
# varibles

#  -    List: A sequence of values of the same type.
#  -    Map: A lookup table, matching keys to values, all of the same type.
#  -    Set: An unordered collection of unique values, all of the same type.

variable "public_subnet_count" {
  description = "Counting Public Sunbets"
  type = number
  default = 2
}

variable "private_subnet_count" {
  description = "Counting private subnets"
  type = number
  default = 2
}

variable "public_subnet_cidr_blocks" {
  description = "Available CIDR blocks for public subnet"
  type = list(string)
  default = [ 
    "10.0.1.0/24",
    "10.0.2.0/24",
    "10.0.3.0/24",
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
    "10.0.7.0/24",
    "10.0.8.0/24",
   ]
}


variable "private_subnet_cidr_blocks" {
  description = "Available cidr blocks for private subnets."
  type        = list(string)
  default     = [
    "10.0.101.0/24",
    "10.0.102.0/24",
    "10.0.103.0/24",
    "10.0.104.0/24",
    "10.0.105.0/24",
    "10.0.106.0/24",
    "10.0.107.0/24",
    "10.0.108.0/24",
  ]
}

# Resource Tags
# variable "resource_tags" {
#   description = "tags to set for all variables"
#   type = map(string)
#   default = {
#     "project" = "project-alpha"
#     "environment" = "dev"
#   }
# }

## NON DEFAULT VARIABLE TO PASS VARIBALE VALUES WHILE RUNNING AS A CMD 
## CMD LINE VAR 

# EC2 Instance Type
variable "ec2_instance_type" {
  description = "EC2 Instance type"
  type = string
}

# Resource Groups 

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {
    project     = "my-project",
    environment = "dev"
  }

  validation {
    condition     = length(var.resource_tags["project"]) <= 16 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["project"])) == 0
    error_message = "The project tag must be no more than 16 characters, and only contain letters, numbers, and hyphens."
  }

  validation {
    condition     = length(var.resource_tags["environment"]) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["environment"])) == 0
    error_message = "The environment tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }
}

