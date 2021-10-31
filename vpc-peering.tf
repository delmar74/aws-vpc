module "vpc1" {
  source = "./modules/vpc"

  region = "eu-north-1"

  env_id             = "vpc-peering"
  base_cidr_block    = "10.1.11.0/24"
}

module "vpc2" {
  source = "./modules/vpc"

  region = "us-east-1"

  env_id             = "vpc-peering"
  base_cidr_block    = "10.1.12.0/24"
}

module "pc" {
  source = "./modules/peering"

  vpc1 = module.vpc1
  vpc2 = module.vpc2

}


