output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

output "subnet_ids" {
  description = "lista dos ids das subnets privadas"
  value       = values(aws_subnet.private)[*].id
}
