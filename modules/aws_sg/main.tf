resource aws_security_group create {
  name        = var.name
  description = "Created by terraform ${var.name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = [for s in var.ingress_data : {
      from_port       = s.from_port
      to_port         = s.to_port
      protocol        = s.protocol
      cidr_blocks     = s.cidr_blocks
      security_groups = s.security_groups
    }]

    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      protocol        = ingress.value.protocol
      cidr_blocks     = ingress.value.cidr_blocks
      security_groups = ingress.value.security_groups
    }
  }

  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.name
  }

  # lifecycle {
  #   ignore_changes = [
  #     ingress,
  #     egress
  #   ]
  # }

}

resource aws_security_group_rule allow_web {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  source_security_group_id = aws_security_group.create.id
  security_group_id        = aws_security_group.create.id
}
