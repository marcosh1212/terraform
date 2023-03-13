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
