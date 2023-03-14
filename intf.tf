resource "aws_network_interface" "intf_instance" {
  count             = length(var.subnets_cidr)
  subnet_id         = element(aws_subnet.private_subnet.*.id,count.index)
  security_groups   = [aws_security_group.marcossh_testesss.id]

  tags = {
    Name = "primary_network_interface-${count.index+1}"
  }
}
