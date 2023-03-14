resource "aws_subnet" "private_subnet" {
  vpc_id             = aws_vpc.vpc-teste.id
  count              = length(var.subnets_cidr)
  cidr_block         = element(var.subnets_cidr,count.index)
  availability_zone  = element(var.azs,count.index)
  
  tags = {
    Name = "private subnet-${count.index+1}"
   }
}
