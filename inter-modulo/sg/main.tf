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

<<<<<<< HEAD
  egress {
    description = "all traffic out"
    protocol  = "-1"
    from_port = 0
    to_port   = 0
=======
  ingress {
    description = "ping in"
    protocol  = "icmp"
    from_port = -1
    to_port   = -1
>>>>>>> terraform
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "All traffic out"
    protocol  = "-1"
    from_port = 0
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  
  tags = {
    Name = "sg-teste"
  }

  provisioner "local-exec" {
    command = "echo ${aws_security_group.sg-teste.id} ${aws_security_group.sg-teste.name}  >> securityGroup.txt"
  }
  
}
