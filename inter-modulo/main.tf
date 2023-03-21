provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "instancia" {
  source = "./instancia"
  
  aws_subnet_id = module.vpc.subnet_id
  aws_vpc_id    = module.vpc.vpc_id
}
