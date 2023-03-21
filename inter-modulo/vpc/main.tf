resource "aws_vpc" "vpc-teste" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.aws_vpc_name
  }
}

resource "aws_subnet" "private" {
  count  = length(var.subnets_cidr)
  vpc_id = aws_vpc.vpc-teste.id
  cidr_block = element(var.subnets_cidr,count.index)
  availability_zone = element(var.azs,count.index)
  tags = {
    Name = "subnets-private-${count.index+1}"
  }
}

resource "aws_security_group" "sg-teste" {
  vpc_id        = aws_vpc.vpc-teste.id
  name          = "sg_teste"
  description   = "sg de teste"
  ingress {
    description = "servicos aws in"
    from_port   = 22000
    to_port     = 65535
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ssh in"
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
        cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "ping in"
    protocol  = "icmp"
    from_port = -1
    to_port   = -1
        cidr_blocks = ["0.0.0.0/0"]
  }
}
