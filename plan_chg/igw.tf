resource "aws_internet_gateway" "igw" {
  vpc_id = data.aws_vpc.vpc-teste.id

  tags = {
    Name = "vpc-vpn-software-express-qa-igw-us-east-1"
  }
}
