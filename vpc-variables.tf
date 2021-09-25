# VPC Input Variables

# VPC Name
variable "vpc_name" {
  description = "VPC Name"
  type = string
  default = "tf_example"
}

# VPC CIDR Block
variable "vpc_cidr_block" {
  description = "VPC CIDR Block"
  type = string
  default = "10.2.0.0/16"
}

# VPC Availability Zones
variable "vpc_availability_zones" {
  description = "VPC Availability Zones"
  type = list(string)
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}

# VPC Public Subnets
variable "vpc_public_subnets" {
  description = "VPC Public Subnets"
  type = list(string)
  default = ["10.2.51.0/24", "10.2.52.0/24"]
}

# VPC Private Subnets
variable "vpc_private_subnets" {
  description = "VPC Private Subnets"
  type = list(string)
  default = ["10.2.1.0/24", "10.2.2.0/24"]
}

# VPC Database Subnets
variable "vpc_database_subnets" {
  description = "VPC Database Subnets"
  type = list(string)
  default = ["10.2.101.0/24", "10.2.102.0/24"]
}

# VPC Create Database Subnet Group (True / False)
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type = bool
  default = true
}

# VPC Create Database Subnet Route Table (True / False)
variable "vpc_create_database_subnet_route_table" {
  description = "VPC Create Database Subnet Route Table"
  default = true
}

# VPC Enable NAT Gateway (True / False)
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Connectivity"
  type = bool
  default = true
}

# VPC Single NAT Gateway (True / False)
variable "vpc_single_nat_gateway" {
  description = "Enable only Single NAT Gateway in one Availability Zone"
  type = bool
  default = true
}