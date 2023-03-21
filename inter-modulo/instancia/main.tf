resource "aws_instance" "instance_teste" {
  ami               = var.image_id
  instance_type     = var.instance_type
#  key_name          = "lab-estudos"
#  security_groups   = var.aws_sg_id
#  vpc_security_group_ids   = var.aws_sg_id
  subnet_id         = var.aws_subnet_id 

  tags    = {
     Name = "teste_instance"
  }
}
