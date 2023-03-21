variable "subnets_cidr" {
  type = list(string)
  default = ["10.55.255.0/28","10.55.255.16/28"]
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

variable "aws_vpc_id" {
  type = string
}
