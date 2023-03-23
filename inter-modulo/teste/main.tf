resource "aws_instance" "instance_teste" {
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



resource "random_pet" "pet_name" {
  length    = 3
  separator = "-"
}

resource "aws_iam_policy" "policy" {
  name        = "${random_pet.pet_name.id}-policy"
  description = "My test policy"

  policy = <<EOT
{
  "Version": "2012-10-17",
  "Statement": [
      {
            "Effect": "Allow",
            "Action": [
                "ssm:List*",
                "ssm:Get*",
                "ssm:UpdateInstanceInformation",
                "ec2:DescribeInstances"
            ],
            "Resource": "*"
            ]
      },

  ]
}
EOT
}
