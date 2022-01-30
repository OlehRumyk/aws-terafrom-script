locals {
  prefix      = "${var.project_name}-${var.environment}"
  date_create = "${formatdate("DD-MM-YYYY hh:mm.ss", timestamp())}"
}

locals {
  permission_balancer = [
    {
      name            = "HTTP"
      from_port       = "80"
      to_port         = "80"
      protocol        = "tcp"
      cidr_blocks     = var.ip_access_list
      security_groups = []
    },
    {
      name            = "SSH"
      from_port       = "2222"
      to_port         = "2222"
      protocol        = "tcp"
      cidr_blocks     = var.ip_access_list
      security_groups = []
    }
  ]
}

locals {
  permission_web = [
    {
      name            = "HTTP"
      from_port       = "80"
      to_port         = "80"
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = [ module.sg_balancer.sg_id ]
    },
    {
      name            = "SSH"
      from_port       = "22"
      to_port         = "22"
      protocol        = "tcp"
      cidr_blocks     = []
      security_groups = [ module.sg_balancer.sg_id ]
    }
  ]
}

