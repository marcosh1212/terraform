resource "aws_instance" "instance_teste" {
  ami               = var.image_id
  instance_type     = var.instance_type
  key_name          = "lab-estudos"
#  security_group   = data.aws_security_group.sg_private.id
  subnet_id         = var.aws_subnet_id 
  tags    = {
     Name = "teste_instance"
  }
}
