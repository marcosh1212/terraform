data "aws_vpc" "vpc-teste" {

  filter {
    name   = "tag:Name"
    values = ["VPC_teste"]
  } 
}
