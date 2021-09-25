# Define local values in Terraform
locals {
  owners = var.business_division
  environment = var.environment
#   name = "${var.business_division}-${var.environment}"
  name = "${local.environment}"
  common_tags = {
      Owner = local.owners
      Environment = local.environment
  }
  multiple_app_instances = {
    one = {
      subnet_id              = module.example_vpc.private_subnets[0]
    }
    two = {
      subnet_id              = module.example_vpc.private_subnets[1]    
    }
  }
}