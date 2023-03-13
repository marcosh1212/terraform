provider "aws" {
}

resource "aws_vpc" "VPC_teste" {
  cidr_block           = var.vpcCIDRblock
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "VPC teste"
}
} 

resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.VPC_teste.id
  cidr_block              = var.privateCIDRblock
  availability_zone       = var.az1
tags = {
   Name = "private subnet"
}

}

resource "aws_network_interface" "intf_instance" {
  subnet_id   = aws_subnet.private_subnet.id
  security_groups   = [aws_security_group.marcossh_testesss.id]
  
  tags = {
    Name = "primary_network_interface"
  }
}


resource "aws_security_group" "marcossh_testesss" {
  vpc_id        = aws_vpc.VPC_teste.id
  name          = "marcossh_testesss" 
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
      
  egress {
    description = "servicos aws out"
    from_port   = 22000
    to_port     = 65535
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    description = "ssh out"
    from_port   = 22
    to_port     = 22
	protocol    = "tcp"
	cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "ping out"
    protocol  = "icmp"
    from_port = -1
    to_port   = -1
	cidr_blocks = ["0.0.0.0/0"]
  }  
}

resource "aws_route_table" "private_RT" {
 vpc_id = aws_vpc.VPC_teste.id
 tags = {
        Name = "private Route table"
}
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_RT.id
}

