# AWS EC2 Security Group Terraform Module
# Security Group for Private EC2 Instances

module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.3.0"

  name = "private-sg"
  description = "Security Group with HTTP & SSH port open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id = module.example_vpc.vpc_id
  # Ingress Rules & CIDR Blocks
  ingress_rules = ["ssh-tcp", "http-80-tcp"]
  ingress_cidr_blocks =  [module.example_vpc.vpc_cidr_block]

  # Egress Rules & CIDR Blocks
  egress_rules = ["all-all"]
  tags = local.common_tags
}