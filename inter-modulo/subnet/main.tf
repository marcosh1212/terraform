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

resource "aws_route_table" "rtb-teste" {
  vpc_id = var.aws_vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.teste_igw.id
  }
  tags = {
    Name = "private-rtb"
  }
}

# Route table association with public subnets
resource "aws_route_table_association" "teste-assoc" {
  count = length(var.subnets_cidr)
  subnet_id      = element(aws_subnet.private.*.id,count.index)
  route_table_id = aws_route_table.rtb-teste.id
}

# Internet Gateway
resource "aws_internet_gateway" "teste_igw" {
  vpc_id = var.aws_vpc_id
  tags = {
    Name = "teste-association"
  }
}
