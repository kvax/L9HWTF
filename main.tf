provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "./modules/vpc"
  vpc_cidr           = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  //azs = var.azs
}

module "alb" {
  source      = "./modules/alb"
  public_subnets = module.vpc.public_subnets
  vpc_id = module.vpc.vpc_id
#   alb_sg         = module.security.alb_sg
}

module "asg" {
  source      = "./modules/asg"
  private_subnets = module.vpc.private_subnets
  //target_group_arn = module.alb.target_group_arn
}

module "rds" {
  source      = "./modules/rds"
  private_subnets = module.vpc.private_subnets
  //rds_sg         = module.security.rds_sg
}
