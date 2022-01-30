#=====================================================================================
# Create key pair in EC2. A key pair is used to control login access to EC2 instances.
#=====================================================================================

resource "aws_key_pair" "create" {
  key_name   = local.prefix
  public_key = var.aws_key_pair
}

#=====================================================================================
# Create VPC
#=====================================================================================

module "vpc" {
  source       = "./modules/aws_vpc"
  name         = local.prefix
  environment  = var.environment
  cidr_network = lookup(var.cidr_network, var.environment)
}

#=====================================================================================
# Create security gtoup for load balancer
#=====================================================================================

module "sg_balancer" {
  source       = "./modules/aws_sg"
  name         = "${local.prefix}-balancer"
  vpc_id       = module.vpc.vpc_id
  ingress_data = local.permission_balancer
}

#=====================================================================================
# Create security gtoup for instance
#=====================================================================================

module "sg_server" {
  source       = "./modules/aws_sg"
  name         = "${local.prefix}-server"
  vpc_id       = module.vpc.vpc_id
  ingress_data = local.permission_web
}

#=====================================================================================
# Create instance in EC2
#=====================================================================================

resource "aws_instance" "web" {
  ami                   = data.aws_ami.linux.id
  instance_type         = "t2.micro"
  user_data             = data.template_file.instance.rendered
  subnet_id             = element(module.vpc.subnet_id, 1)
  security_groups       = [ module.sg_server.sg_id ]
  key_name              = aws_key_pair.create.key_name
  tags = {
    Name            = "${local.prefix}-web"
    Environment     = var.environment
    Date_creation   = local.date_create
    OS_type         = data.aws_ami.linux.platform_details
    Your_First_Name = var.your_first_name
    Your_Last_Name  = var.your_last_name
    AWS_Account_ID  = data.aws_caller_identity.current.account_id
  }

}

#=====================================================================================
# Create locad balanser for EC2 instance
#=====================================================================================

resource "aws_elb" "create" {
  name            = local.prefix
  security_groups = [module.sg_balancer.sg_id]
  subnets         = module.vpc.subnet_id
  instances       = [aws_instance.web.id]  
  idle_timeout    = 3600

  listener {
    instance_port     = "22"
    instance_protocol = "tcp"
    lb_port           = "2222"
    lb_protocol       = "tcp"
  }
  
  listener {
    instance_port     = "80"
    instance_protocol = "http"
    lb_port           = "80"
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 15
  }

  tags = {
    Name        = "${local.prefix}-elb"
    Environment = var.environment
  }

  depends_on = [
    aws_instance.web
  ]
}

