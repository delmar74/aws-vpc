provider "aws" {
  region = var.source_region
}

resource "aws_vpc_peering_connection" "pc" {
  vpc_id      = var.vpc1
  peer_vpc_id = var.vpc2
  peer_region = var.dest_region

  tags = {
    Name = "peering-connection"
  }
}
