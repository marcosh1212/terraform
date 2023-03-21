resource "aws_vpc" "vpc-teste" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.aws_vpc_name
  }
}

resource "aws_subnet" "private" {
  count  = length(var.subnets_cidr)
  vpc_id = aws_vpc.vpc-teste.id
  cidr_block = element(var.subnets_cidr,count.index)
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "subnets-private-${count.index+1}"
  }
}
