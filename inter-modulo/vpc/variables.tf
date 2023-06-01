variable "tags" {
  type    = map(string)
  default = {}
}

variable "prefix_name" {
  type    = string
  default = "vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "192.168.20.0/24"
}

variable "environment" {
  type    = string
  default = ""
}

variable "tgw_id" {
  type    = string
  default = ""
}

variable "rfc1918_cidr" {
  type    = list(string)
  default = ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"]
}

variable "interface_endpoints" {
  description = "A list of interface endpoints"
  type        = list(string)
  default     = [
    "ssm",
    "ssmmessages",
    "ec2messages"
  ]
}

variable "gateway_endpoints" {
  description = "A list of gateway endpoints"
  type        = list(string)
  default     = []
}

variable "vpc_flow_log" {
  type    = bool
  default = false
}
