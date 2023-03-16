#resource "aws_route_table_association" "private_association" {
#  count             = length(var.subnets_cidr)
#  subnet_id         = element(aws_subnet.private_subnet.*.id,count.index)
#  subnet_id      = aws_subnet.private_subnet.id
#  route_table_id = aws_route_table.private_RT.id
#}


resource "aws_route_table_association" "public_association" {
  subnet_id       = data.aws_subnet.public_subnet.id

  route_table_id  = data.aws_route_table.public_RTB.id
}

resource "aws_route_table_association" "private_association" {
  subnet_id       = data.aws_subnet.private_subnet.id

  route_table_id  = data.aws_route_table.private_RTB.id
}
