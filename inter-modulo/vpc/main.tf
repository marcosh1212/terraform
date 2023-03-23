resource "aws_vpc" "vpc-teste" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.aws_vpc_name
  }

  provisioner "local-exec" {
    when = destroy
    command = "echo 'Destroy-time provisioner'"
  }
}
