provider "aws" {
}

resource "aws_vpc" "vpc-teste" {
  cidr_block           = var.vpcCIDRblock
  enable_dns_support   = var.dnsSupport 
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "VPC_teste"
}
} 
