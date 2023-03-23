resource "aws_subnet" "private" {
  count = length(var.subnets_cidr)
  vpc_id = var.aws_vpc_id
  cidr_block = element(var.subnets_cidr,count.index)
  availability_zone = element(var.azs,count.index)
#  map_private_ip_on_launch = false
  tags = {
    Name = "private-${count.index+1}"
  }
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
