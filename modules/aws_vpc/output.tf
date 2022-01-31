output vpc_id {
  description = "ID private VPC"
  value       = aws_vpc.private.id
}

output subnet_id {
  description = "ID list subnets"
  value       = aws_subnet.private.*.id
}

output subnet_arn {
  description = "ARN list subnets"
  value       = aws_subnet.private.*.arn
}

output owner_id {
  description = "ID owner list subnets"
  value       = aws_subnet.private.*.owner_id
}

output subnet_cidr_block {
  description = "List subnets cidr block"
  value       = aws_subnet.private.*.cidr_block
}
