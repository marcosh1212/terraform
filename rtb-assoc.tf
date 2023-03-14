resource "aws_route_table_association" "private_association" {
  count             = length(var.subnets_cidr)
  subnet_id         = element(aws_subnet.private_subnet.*.id,count.index)
#  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_RT.id
}
