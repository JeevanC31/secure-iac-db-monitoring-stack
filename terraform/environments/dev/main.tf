module "vpc" {
  source              = "../../modules/vpc"
  cidr_block          = var.cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  env                 = "dev"
}

module "bastion" {
  source        = "../../modules/ec2"
  ami           = var.ami
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_id
  vpc_id        = module.vpc.vpc_id
  key_name      = var.key_name
  env           = "bastion"
}

module "ec2" {
  source        = "../../modules/ec2"
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = module.vpc.private_subnet_id
  vpc_id        = module.vpc.vpc_id
  key_name      = var.key_name
  env           = "dev"

  allowed_ssh_sg_id = module.bastion.security_group_id
}
