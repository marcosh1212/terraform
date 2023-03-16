data "aws_vpc" "vpc-teste" {
#  most_recent = true

#  filter {
#    name   = "volume-type"
#    values = ["gp2"]
#  }

  filter {
    name   = "tag:Name"
    values = ["VPC_teste"]
  }
}

data "aws_subnet" "public_subnet" {

  filter {
    name   = "tag:Name"
    values = ["private subnet-2"]
  }
}

data "aws_subnet" "private_subnet" {

  filter {
    name   = "tag:Name"
    values = ["private subnet-1"]
  }
}

data "aws_route_table" "public_RTB" {

  filter {
    name   = "tag:Name"
    values = ["public Route table"]
  }
}

data "aws_route_table" "private_RTB" {

  filter {
    name   = "tag:Name"
    values = ["private Route table"]
  }
}
