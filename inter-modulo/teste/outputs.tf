#output "subnet_ids" {
#  value = [for s in data.aws_subnet.private : s.id]
#}

output "subnet_id" {
  value = data.aws_subnet.private.id
}

output "rtb-id" {
  value = data.aws_route_table.private.id
}
