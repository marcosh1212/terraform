data "aws_vpc" "vpc-teste" {

  filter {
    name   = "tag:Name"
    values = ["vpc-teste"]
  }
}

data "aws_security_group" "sg-teste" {

  filter {
    name   = "tag:Name"
    values = ["sg-teste"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["private-1","private-2"]
  }
}

data "aws_subnet" "private" {
  filter {
    name   = "tag:Name"
    values = ["private-1"]
  }
}

data "aws_subnet" "private1" {
  filter {
    name   = "tag:Name"
    values = ["private-1", "private-2"]
  }
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}

data "aws_route_table" "private" {

  filter {
    name   = "tag:Name"
    values = ["private-rtb"]
  }
}
