output "subnet_id" {
  value = aws_subnet.private.*.id
#  value = aws_subnet.private.id
}
