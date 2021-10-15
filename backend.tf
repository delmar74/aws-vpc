terraform {
  backend "s3" {
    bucket = "delmar-tf-state"
    key    = "tfstates/terraform.tfstate"
    region = "us-east-1"
  }
}
