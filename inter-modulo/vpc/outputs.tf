output "vpc_id" {
  value = aws_vpc.vpc-teste.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc-teste.cidr_block
}
