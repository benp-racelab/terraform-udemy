# VPC Output Values

# VPC ID
output "vpc_id" {
  description = "The ID of the VPC"
  value = module.example_vpc.vpc_id
}

# VPC CIDR Blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value = module.example_vpc.vpc_cidr_block
}

# VPC Private Subnets
output "private_subnets" {
  description = "List of IDs of the private subnets"
  value = module.example_vpc.private_subnets
}

# VPC Public Subnets
output "public_subnets" {
  description = "List of IDs of the public subnets"
  value = module.example_vpc.public_subnets
}

# VPC NAT Gateway Public IP
output "nat_public_ips" {
  description = "List of public Elastic IPs created for the AWS NAT Gateway"
  value = module.example_vpc.nat_public_ips
}

# VPC AZs
output "azs" {
  description = "A list of the availability zones specified as argument"
  value = module.example_vpc.azs
}
