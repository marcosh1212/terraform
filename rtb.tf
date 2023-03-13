resource "aws_route_table" "private_RT" {
  vpc_id = aws_vpc.VPC_teste.id
  tags = {
    Name = "private Route table"
  }
}
