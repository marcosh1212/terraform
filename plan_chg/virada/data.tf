data "aws_vpc" "vpc-teste" {

  filter {
    name   = "tag:Name"
    values = ["VPC_teste"]
  } 
}

data "aws_subnet" "public_subnet" {

  filter {
    name   = "tag:Name"
    values = ["public-*"]
  }
}

data "aws_subnet" "subnet_fw_a" {

  filter {
    name   = "tag:Name"
    values = ["snet-vpn-software-express-qa-fw-us-east-1"]
  }
}

data "aws_subnet" "subnet_fw_b" {

  filter {
    name   = "tag:Name"
    values = ["snet-vpn-software-express-qa-fw-us-east-2"]
  }
}

data "aws_subnet" "private_subnet" {

  filter {
    name   = "tag:Name"
    values = ["private-*"]
  }
}

data "aws_route_table" "RTB1" {

  filter {
    name   = "tag:Name"
    values = ["rtb-vpc-vpn-software-express-qa-fw-us-east-*"]
  }
}

data "aws_route_table" "private_RTB" {

  filter {
    name   = "tag:Name"
    values = ["private Route table"]
  }
}
