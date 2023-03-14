resource "aws_instance" "instance_teste" {
  ami               = var.image_id
  instance_type     = var.instance_type
#  key_name          = "lab-estudos"
  #security_groups   = ["{$aws_security_group.marcossh_testesss.name}"]
  
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.intf_instance.1.id
    
  }
  
  tags    = {
     Name = "teste_instance"
  }
}
