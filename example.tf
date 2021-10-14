
module "vpc-test" {

  source = "./modules/vpc"

  base_cidr_block    = "10.1.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1c"]
}

## OUTPUTS 
output "vpc-test_vpc_id" {
  value = module.vpc-test.vpc_id
}

output "vpc-test_vpc_cidr" {
  value = module.vpc-test.vpc_cidr
}

output "vpc-test_public_subnet_ids" {
  value = module.vpc-test.public_subnet_ids
}
output "vpc-test_private_subnet_ids" {
  value = module.vpc-test.private_subnet_ids
}

