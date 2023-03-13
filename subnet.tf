resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.VPC_teste.id
  cidr_block              = var.privateCIDRblock
  availability_zone       = var.az1
tags = {
   Name = "private subnet"
}

}
