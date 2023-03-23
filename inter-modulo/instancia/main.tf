resource "aws_instance" "instance_teste" {
  depends_on        = [aws_iam_policy.ssm-policy]
  ami               = var.image_id
  instance_type     = var.instance_type
  security_groups   = [data.aws_security_group.sg-teste.id]
  subnet_id         = data.aws_subnet.private.id

  tags    = {
     Name = "teste_instance"
  }
}

######################
# VPC Endpoint for SSM
######################

resource "aws_vpc_endpoint" "ssm" {
  depends_on           = [aws_instance.instance_teste]
  vpc_id               = data.aws_vpc.vpc-teste.id
  vpc_endpoint_type    = "Interface"
  service_name         = "com.amazonaws.us-east-1.ssm"

  security_group_ids   = ["${data.aws_security_group.sg-teste.id}"]
#  security_group_ids  = ["${aws_security_group.ssm.id}", "${var.ssm_endpoint_security_group_ids}"]
  subnet_ids           = data.aws_subnet.private.*.id
#  private_dns_enabled = 
}
