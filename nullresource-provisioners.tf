# Create a Null Resource and Provisioners
resource "null_resource" "name" {
  depends_on = [ module.ec2_public ]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type = "ssh"
    host = aws_eip.bastion_eip.public_ip
    user = "ec2-user"
    password = ""
    private_key = file("private-key/terraform-udemy-key.pem")
    
  }

  # File Provisioner: Copies the terraform-udemy-key.pem file to /tmp/terraform-udemy-key.pem
  provisioner "file" {
    source = "private-key/terraform-udemy-key.pem"
    destination = "/tmp/terraform-udemy-key.pem"
  }
  
  # Remote Exec Provisioner: Using remote-exec provisioner to fix the private key permissions
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-udemy-key.pem"
    ]
  }

  # Local Exec Provisioner: local-exec privisioner (Create time provisioner)
  provisioner "local-exec" {
    command = "echo VPC create on `date` and VPC ID: ${module.example_vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    on_failure = continue
  }

  # Local Exec Provisioner: local-exec privisioner (Destroy time provisioner)
/*  provisioner "local-exec" {
    command = "echo Destroy time prov `date` >> destroy-time-prov.txt"
    working_dir = "local-exec-output-files/"
    when = destroy
  } */
}

# Creation Time Provisioners - By default they are created during resource creations

# Destroy Time Provisioners - Will be executed during "terraform destroy" command