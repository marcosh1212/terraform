resource "aws_route_table_association" "teste-association" {
  for_each      = toset(data.aws_subnets.private.ids)
  subnet_id      = each.value

  route_table_id = "rtb-0bfba7fbadf947b3c"
}

#resource "aws_route_table_association" "teste-association1" {
#
#  subnet_id      = "data.aws_subnet_ids.private2.id"
#
#  route_table_id = "data.aws_route_table.rtb-teste.id"
#}
