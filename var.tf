variable "region" {
     default = "us-east-1"
}
variable "azs" {
  type = list(string)
}

variable "az2" {
     default = "us-east-1c"
}

variable "image_id" {
  type = string
  description = "O id da imagem AMI"
  default = "ami-005f9685cb30f234b"

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "A imagem precisa ser uma imagem AMI válida. " 
  }
}

variable "instance_type" {
  type = string
}

variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "vpcCIDRblock" {
    default = "192.168.10.0/24"
}
variable "privateCIDRblock" {
    default = "192.168.10.0/26"
}

variable "subnets_cidr" {
    type = list(string)
}
variable "publicdestCIDRblock" {
    default = "0.0.0.0/0"
}
variable "localdestCIDRblock" {
    default = "10.0.0.0/16"
}
variable "ingressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "egressCIDRblock" {
    type = list
    default = [ "0.0.0.0/0" ]
}
variable "mapPublicIP" {
    default = true
}
