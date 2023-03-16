resource "aws_route_table" "private_RT" {
  vpc_id = data.aws_vpc.vpc-teste.id

  tags = {
    Name = "private Route table"
  }
}

resource "aws_route_table" "public_RTB" {
  vpc_id = data.aws_vpc.vpc-teste.id

  tags = {
    Name = "public Route table"
  }
}
