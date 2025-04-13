provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
}

module "bastion" {
  source                 = "./modules/bastion"
  ec2_key_name           = var.ec2_key_name
  bastion_instance_type  = var.bastion_instance_type
  ami_id                 = var.bastion_ami
  vpc_id                 = module.vpc.vpc_id
  public_subnet_ids      = module.vpc.public_subnet_ids
}

module "wordpress" {
  source                  = "./modules/wordpress"
  vpc_id                  = module.vpc.vpc_id
  private_subnet_ids      = module.vpc.private_subnet_ids
  ami_id                  = var.wordpress_ami
  ec2_key_name            = var.ec2_key_name
  wordpress_instance_type = var.wordpress_instance_type
  bastion_sg_id           = module.bastion.bastion_sg_id   
}

module "rds" {
  source              = "./modules/rds"
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  ec2_sg_id           = module.wordpress.wordpress_sg_id
  db_name             = var.db_name
  db_user             = var.db_user
  db_pass             = var.db_pass
}

module "efs" {
  source             = "./modules/efs"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  ec2_sg_id          = module.wordpress.wordpress_sg_id
}

module "alb" {
  source             = "./modules/alb"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
}

module "asg" {
  source             = "./modules/asg"
  ami_id             = var.wordpress_ami
  instance_type      = var.wordpress_instance_type
  key_pair_name      = var.ec2_key_name
  security_group_ids = [module.wordpress.wordpress_sg_id]
  private_subnet_ids = module.vpc.private_subnet_ids
  target_group_arn   = module.alb.alb_target_group_arn
  efs_dns_name       = module.efs.efs_dns_name
}
