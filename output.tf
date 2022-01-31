output vpc_id {
  description = "ID private VPC"
  value       = module.vpc.vpc_id
}

output vpc_subnet_id {
  description = "ID list subnets"
  value       = module.vpc.subnet_id
}

output instance_id {
  description = ""
  value       = aws_instance.web.id
  sensitive   = false
  depends_on  = []
}

output instance_public_ip {
  description = ""
  value       = aws_instance.web.public_ip
  sensitive   = false
  depends_on  = [
    aws_instance.web
  ]
}

output instance_platform {
  description = ""
  value       = data.aws_ami.linux.platform_details
  sensitive   = false
  
  depends_on  = [
    data.aws_ami.linux
  ]

}

output lb_dns {
  description = ""
  value       = aws_elb.create.dns_name
  sensitive   = false
  
  depends_on  = [
    aws_elb.create
  ]

}

output ip_access_list {
  description = "IP whitelist"
  sensitive   = false
  value       = var.ip_access_list
}

