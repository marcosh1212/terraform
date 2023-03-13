resource "aws_network_interface" "intf_instance" {
  subnet_id   = aws_subnet.private_subnet.id
  security_groups   = [aws_security_group.marcossh_testesss.id]

  tags = {
    Name = "primary_network_interface"
  }
}
