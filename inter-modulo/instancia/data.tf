data "aws_security_group" "sg_private" {

  filter {
    name   = "tag:Name"
    values = ["teste"]
  }
}
