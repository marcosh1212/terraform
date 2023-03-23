data "aws_vpc" "vpc-teste" {

  filter {
    name   = "tag:Name"
    values = ["vpc-teste"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["subnets-private-1","subnets-private-2"]
  }
}

data "aws_subnet" "private" {
  for_each = toset(data.aws_subnets.private.ids)
  id       = each.value
}

data "aws_route_table" "private" {

  filter {
    name   = "tag:Name"
    values = ["rtb-teste"]
  }
}
