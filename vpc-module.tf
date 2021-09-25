# Create Terraform VPC Module
# Create the Terraform Example VPC
module "example_vpc" {
    source                                    = "terraform-aws-modules/vpc/aws"
    version                                   = "3.7.0" # Public
    
    # VPC Basics
    name                                      = "${var.vpc_name}-${local.name}"
    cidr                                      = var.vpc_cidr_block
    azs                                       = var.vpc_availability_zones
    public_subnets                            = var.vpc_public_subnets
    private_subnets                           = var.vpc_private_subnets
    
    # Database Subnets
    database_subnets                          = var.vpc_database_subnets
    create_database_subnet_group              = var.vpc_create_database_subnet_group
    create_database_subnet_route_table        = var.vpc_create_database_subnet_route_table
    # create_database_internet_gateway_route    = true
    # create_database_nat_gateway_route         = true

    # NAT Gateways - Outbound Communication
    enable_nat_gateway                        = var.vpc_enable_nat_gateway
    single_nat_gateway                        = var.vpc_single_nat_gateway

    # VPC DNS Parameters
    enable_dns_hostnames                      = true
    enable_dns_support                        = true

    tags = local.common_tags
    vpc_tags = local.common_tags
    
    public_subnet_tags = {
        Type: "TF Public Subnet"
    }

    private_subnet_tags = {
        Type: "TF Private Subnet"
    }
    
    database_subnet_tags = {
        Type: "TF Database Subnet"
    }
}