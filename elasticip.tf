# Create Elastic IP for Bastion Host
# Resource - depends on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [ module.ec2_public, module.example_vpc ]
  instance = module.ec2_public.id
  vpc      = true
  tags = local.common_tags
}