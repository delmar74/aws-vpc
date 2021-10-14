
module "vpc-test" {

  source = "./modules/vpc"

  env_id             = "test"
  base_cidr_block    = "10.1.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1c"]
}
