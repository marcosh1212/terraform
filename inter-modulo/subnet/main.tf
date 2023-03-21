resource "aws_subnet" "private" {
  count  = length(var.subnets_cidr)
  vpc_id = var.aws_vpc_id
  cidr_block = element(var.subnets_cidr,count.index)
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "subnets-private-${count.index+1}"
  }
}
