# AWS EC2 Instance Terraform Outputs
# Public EC2 Instance - Bastion Host
output "ec2_bastion_public_instance_ids" {
  description = "List of IDs of the instances"
  value       = module.ec2_public.id
}

output "ec2_bastion_public_ip" {
  description = "list of public IP names assigned to the instances"
  value       = module.ec2_public.public_ip
}

# Private EC2 Instances
output "ec2_private_instance_ids" {
  description = "List of IDs of the instances"
  value = toset([for t in module.ec2_private: t.id])
  #value       = module.ec2_private.id
}

output "ec2_private_ip" {
  description = "list of private IP names assigned to the instances"
  value = toset([for t in module.ec2_private: t.private_dns])
  #value       = module.ec2_private.private_dns
}