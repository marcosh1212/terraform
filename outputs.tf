output "vpc_id" {
  value = aws_vpc.vpc-teste.id
}

output "subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "instance_id" {
  value = aws_instance.instance_teste.id
}
