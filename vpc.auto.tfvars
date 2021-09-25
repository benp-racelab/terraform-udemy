# VPC Variables
vpc_name = "tf_example_vpc"
vpc_cidr_block = "10.2.0.0/16"
vpc_availability_zones = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
vpc_public_subnets = ["10.2.51.0/24", "10.2.52.0/24"]
vpc_private_subnets = ["10.2.1.0/24", "10.2.2.0/24"]
vpc_database_subnets = ["10.2.101.0/24", "10.2.102.0/24"]
vpc_create_database_subnet_group = true
vpc_create_database_subnet_route_table = true
vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true