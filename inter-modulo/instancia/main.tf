resource "aws_instance" "instance_teste" {
  ami               = var.image_id
  instance_type     = var.instance_type
#  key_name          = "lab-estudos"
  security_groups   = [aws_security_group.sg-teste.id]
  subnet_id         = var.aws_subnet_id 

  tags    = {
     Name = "teste_instance"
  }
}

resource "aws_security_group" "sg-teste" {
  vpc_id        = var.aws_vpc_id
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
  
  tags = {
    Name = "sg-teste"
  }
}
