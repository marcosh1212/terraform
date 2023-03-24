resource "aws_instance" "instance_teste" {
  depends_on           = [aws_vpc_endpoint.ssm]

  ami                  = var.image_id
  instance_type        = var.instance_type
  security_groups      = [data.aws_security_group.sg-teste.id]
  subnet_id            = data.aws_subnet.private.id
  iam_instance_profile = "Acesso_ssm"
  associate_public_ip_address = true
  tags    = {
     Name = "teste_instance"
  }
}

######################
# VPC Endpoint for SSM
######################

resource "aws_vpc_endpoint" "ssm" {
  vpc_id               = data.aws_vpc.vpc-teste.id
  vpc_endpoint_type    = "Interface"
  service_name         = "com.amazonaws.us-east-1.ssm"
  policy               = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AllowAll",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "*"
         },
         "Action" : [
           "ssm:List*",
           "ssm:Get*",
           "ssm:UpdateInstanceInformation",
         ],
         "Resource" : "*"
       }
     ]
   })


  security_group_ids   = ["${data.aws_security_group.sg-teste.id}"]
  subnet_ids           = data.aws_subnet.private.*.id
  private_dns_enabled  = true 
}

resource "aws_vpc_endpoint" "ssmmessages" {
#  depends_on        = [aws_vpc_endpoint.ssm]
  vpc_id               = data.aws_vpc.vpc-teste.id
  vpc_endpoint_type    = "Interface"
  service_name         = "com.amazonaws.us-east-1.ssmmessages"

  security_group_ids   = ["${data.aws_security_group.sg-teste.id}"]
  subnet_ids           = data.aws_subnet.private.*.id
  private_dns_enabled  = true 
}

resource "aws_vpc_endpoint" "ec2messages" {
#  depends_on        = [aws_vpc_endpoint.ssmmessages]
  vpc_id               = data.aws_vpc.vpc-teste.id
  vpc_endpoint_type    = "Interface"
  service_name         = "com.amazonaws.us-east-1.ec2messages"

  security_group_ids   = ["${data.aws_security_group.sg-teste.id}"]
  subnet_ids           = data.aws_subnet.private.*.id
  private_dns_enabled  = true 
}
