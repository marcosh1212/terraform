resource "aws_route_table" "RTB1" {
  vpc_id = data.aws_vpc.vpc-teste.id

  depends_on = [aws_internet_gateway.igw]

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   
  tags = {
    Name = "rtb-vpc-vpn-software-express-qa-fw-us-east-1"
  }
}
