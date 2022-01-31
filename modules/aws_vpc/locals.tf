locals {
  availability_zones = data.aws_availability_zones.available.names
  cidr_private_subnets  = 1
  max_private_subnets   = length(data.aws_availability_zones.available.names)
}

locals {
  private_subnets = [
    for az in local.availability_zones :
    "${var.cidr_network}.${local.cidr_private_subnets + index(local.availability_zones, az)}.0/24"
    if index(local.availability_zones, az) < local.max_private_subnets
  ]
}

# locals {
#   public_subnets = [
#     for az in local.availability_zones :
#     "${var.cidr_network}.${local.cidr_public_subnets + index(local.availability_zones, az)}.0/24"
#     if index(local.availability_zones, az) < local.max_private_subnets
#   ]
# }