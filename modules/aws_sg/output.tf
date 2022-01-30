output sg_id {
  description = "ID created security group"
  value       = aws_security_group.create.id
}

output sg_name {
  value       = "aws_security_group.create.name"
  description = "Name created security group"
}
