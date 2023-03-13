variable "region" {
     default = "us-east-1"
}
variable "az1" {
     default = "us-east-1a"
}
variable "az2" {
     default = "us-east-1c"
}
variable "instanceTenancy" {
    default = "default"
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
	default = ["10.0.1.0/24","10.0.2.0/24"]
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
