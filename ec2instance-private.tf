# AWS EC2 Instance Terraform Module
# Private Host - EC2 Instance that will be created in VPC Public Subnet
module "ec2_private" {
  depends_on = [ module.example_vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.1.0"

  for_each = local.multiple_app_instances

  name = "MyInstance-${each.key}-${var.environment}"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  subnet_id              = each.value.subnet_id
  # monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  # subnet_id              = module.example_vpc.public_subnets[0]

  user_data = file("${path.module}/app1-install.sh")
  tags = local.common_tags

}

# Meta-Argument depends_on