resource "aws_vpc" "private" {
  cidr_block            = "${var.cidr_network}.0.0/16"
  enable_dns_hostnames  = true
  tags = {
    Name        = "${var.name}-vpc"
    Environment = var.environment
  }
}

resource "aws_internet_gateway" "private" {
  vpc_id = aws_vpc.private.id
  tags = {
    Name        = "${var.name}-igw"
    Environment = var.environment
  }
}

resource "aws_route_table" "route" {
  vpc_id = aws_vpc.private.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.private.id
  }
  tags = {
    Name        = "${var.name}-subnet-route"
    Environment = var.environment
  }
}

resource "aws_subnet" "private" {
  count             = length(local.private_subnets)
  vpc_id            = aws_vpc.private.id
  cidr_block        = local.private_subnets[count.index]
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  tags = {
    Name        = "${var.name}-subnet"
    Environment = var.environment
  }
  map_public_ip_on_launch = true
}

resource "aws_route_table_association" "private" {
  count          = length(local.private_subnets)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.route.*.id, count.index)
}
