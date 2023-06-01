variable "tags" {
  type    = map(string)
  default = {}
}

variable "vpc_id" {
  type  = string
  default = ""
}

variable "vpc_cidr" {
  type  = string
  default = ""
}

variable "vpc_name" {
  type  = string
  default = ""
}

variable "interface_endpoints" {
  description = "Lista de subnets e interface endpoints"
  type  = object({
    subnet_ids     = list(string)
    services       = list(string)
  })
  default = {
    subnet_ids     = []
    services       = []
  }
}
