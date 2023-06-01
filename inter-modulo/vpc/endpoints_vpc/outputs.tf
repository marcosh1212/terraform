output "endpoint_ssm" {
  description = "id do endpoint de ssm"
  value       = values(aws_vpc_endpoint.interface_endpoints)[*].id
}
