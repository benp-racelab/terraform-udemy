# Security Group for Public Load Balancer
module "loadbalancer_sg" {
    source  = "terraform-aws-modules/security-group/aws"
    version = "4.3.0"

    name = "loadbalancer-sg"
    description = "Security Group with HTTP & SSH port open for entire Internet (IPv4 CIDR), egress ports all"
    vpc_id = module.example_vpc.vpc_id
    
    # Ingress Rules & CIDR Blocks
    ingress_rules = ["ssh-tcp", "http-80-tcp"]
    ingress_cidr_blocks = ["0.0.0.0/0"]

    # Egress Rule - all-all open
    egress_rules = ["all-all"]
    tags = local.common_tags

    # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
    ingress_with_cidr_blocks = [
        {
            from_port = 81
            to_port = 81
            protocol = 6
            description = "Allow Port 81 from internet"
            cidr_blocks = "0.0.0.0/0"
        }
    ]
}