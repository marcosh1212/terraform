resource "aws_subnet" "subnet_fw" {
  vpc_id             = data.aws_vpc.vpc-teste.id
  count              = length(var.subnet_fw)
  cidr_block         = element(var.subnet_fw,count.index)
  availability_zone  = element(var.azs,count.index)
  
  tags = {
    Name = "snet-vpn-software-express-qa-fw-us-east-${count.index+1}"
   }
}
