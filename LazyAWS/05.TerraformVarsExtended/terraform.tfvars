# Entering variable values manually is time consuming and error prone. 
# Instead, you can capture variable values in a file.
# in terraform community the file terraform.tfvars is use to capture values
# in HCP Terraform the same file is named as terraform.auto.tfvars

# Resource Tags
resource_tags = {
  "project" = "alpha"
  "environment" = "dev"
  "owner" = "trivedisaksham@gmail.com"
}

# Instance Type (CLI Parsed value)
ec2_instance_type = "t2.micro"

# Instance count
instance_count = 3

