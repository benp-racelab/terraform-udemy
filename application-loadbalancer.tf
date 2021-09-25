# Terraform AWS Application Load Balancer (ALB)
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "6.5.0"

  name = "${local.name}-alb"
  load_balancer_type = "application"

  vpc_id             = module.example_vpc.vpc_id
  subnets            = [
      module.example_vpc.public_subnets[0],
      module.example_vpc.public_subnets[1]
  ]
  security_groups    = [ module.loadbalancer_sg.security_group_id ]

  # Listeners
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  # Target Groups
  target_groups = [
    # App 1 Target Group - TG Index = 0
    {
      name_prefix      = "app1-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      deregistration_delay = 10
      health_check = {
        enabled = true
        interval = 30
        path = "/app1/index.html"
        port = "traffic-port"
        healthy_threshold = 3
        unhealthy_threshold = 3
        timeout = 6
        protocol = "HTTP"
        matcher = 200-399

      }
      protocol_version = "HTTP2"
      # App1 Target Group - Targets
      targets = {
        my_app1_vm1 = {
          target_id = module.ec2_private.id[0]
          port      = 80
        },
        my_app1_vm2 = {
          target_id = module.ec2_private.id[1]
          port      = 80
        }
      }
      tags = local.common_tags
    }
  ]

  # Application Target Group

  # access_logs = {
  #   bucket = "my-alb-logs"
  # }

  # https_listeners = [
  #   {
  #     port               = 443
  #     protocol           = "HTTPS"
  #     certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
  #     target_group_index = 0
  #   }
  # ]

  

  tags = local.common_tags
}