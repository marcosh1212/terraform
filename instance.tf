resource "aws_instance" "instance_teste" {
  ami               = "ami-005f9685cb30f234b"
  instance_type     = "t2.micro"
#  key_name          = "lab-estudos"
  #security_groups   = ["{$aws_security_group.marcossh_testesss.name}"]
  
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.intf_instance.id
    
  }
  
  tags    = {
     Name = "teste_instance"
  }
}
