module "vpc1" {
  source = "./modules/vpc"

  region = "us-east-1"

  env_id          = "vpc-peering"
  base_cidr_block = "10.1.11.0/24"
}

module "vpc2" {
  source = "./modules/vpc"

  region = "us-west-2"

  env_id          = "vpc-peering"
  base_cidr_block = "10.1.12.0/24"
}

module "pc" {
  source = "./modules/peering"

  source_region = "us-east-1"
  dest_region   = "us-west-2"
  vpc1          = module.vpc1.vpc_id
  vpc2          = module.vpc2.vpc_id

}
