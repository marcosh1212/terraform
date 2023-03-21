output "subnet_id" {
  value = aws_subnet.private.0.id
}

output "sg_id" {
  value = aws_security_group.sg-teste.id
}
