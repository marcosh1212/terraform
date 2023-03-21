provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./vpc"
}

module "instancia" {
  source = "./instancia"

  aws_subnet_id = module.vpc.subnet_id
  aws_sg_id     = module.sg.sg_id
}

module "sg" {
  source = "./sg"

  aws_vpc_id    = module.vpc.vpc_id
}
