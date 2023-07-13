resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = merge(
    { "Name" = "${local.vpc_name}" },
    var.tags
  )
}

resource "aws_default_security_group" "default_sg" {
  vpc_id = aws_vpc.this.id
  tags = merge(
    { "Name" = "${local.vpc_name}-default-sgp" },
    var.tags
  )
}


resource "aws_subnet" "private" {
  for_each          = toset(local.az)
  depends_on        = [aws_vpc.this]
  vpc_id            = aws_vpc.this.id
  cidr_block        = cidrsubnet(var.vpc_cidr, local.newbits, local.netnum[each.value])
  availability_zone = each.value
  tags = merge(
    { "Name" = "${local.vpc_name}-private-subnet-${each.value}" },
    var.tags
  )
}

resource "aws_route_table" "private" {
  for_each = toset(local.az)
  vpc_id   = aws_vpc.this.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = merge(
    { "Name" = "${local.vpc_name}-private-rtb-${each.value}" },
    var.tags
  )
}

resource "aws_route_table_association" "private" {
  for_each       = toset(local.az)
  subnet_id      = aws_subnet.private[each.value].id
  route_table_id = aws_route_table.private[each.value].id
}

module "vpc_endpoints" {
  source   = "./endpoints_vpc"
  vpc_id   = aws_vpc.this.id
  vpc_name = local.vpc_name
  vpc_cidr = var.vpc_cidr
  interface_endpoints = {
    subnet_ids = values(aws_subnet.private)[*].id
    services   = var.interface_endpoints
  }
}

# Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "teste-association"
  }
}


#resource "aws_route_table" "rtb-teste" {
#  vpc_id = aws_vpc.this.id
#  
#  tags = {
#    Name = "private-rtb"
#  }
#}


