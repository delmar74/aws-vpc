terraform {
  backend "s3" {
    bucket = "delmar-tf-state-storage"
    key    = "tfstates/terraform.tfstate"
    region = "eu-north-1"
  }
}
