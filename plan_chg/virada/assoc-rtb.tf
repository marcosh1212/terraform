resource "aws_route_table_association" "public_association_a" {
  
  subnet_id       = data.aws_subnet.subnet_fw_a.id

  route_table_id  = data.aws_route_table.RTB1.id
}

resource "aws_route_table_association" "public_association_b" {
  
  subnet_id       = data.aws_subnet.subnet_fw_b.id

  route_table_id  = data.aws_route_table.RTB1.id
}
