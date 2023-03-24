resource "aws_vpc" "vpc-teste" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = var.aws_vpc_name
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo 'Destroy-time provisioner'"
  }
}
