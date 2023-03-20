variable "vpc_cidr" {
  default = "192.168.200.0/24"
}

variable "aws_vpc_name" {
  type = string
  default = "vpc-teste"
}

variable "subnets_cidr" {
  type = list(string)
  default = ["192.168.200.0/26","192.168.200.64/26"]
}

variable "azs" {
  type = list(string)
  default = ["us-east-1a","us-east-1b"]
}

variable "aws_igw_name" {
  type = string
  default = "igw-teste"
}

variable "aws_rtb_name" {
  type = string
  default = "rtb-teste"
}
