resource "aws_vpc_peering_connection" "pc" {
  peer_vpc_id   = vpc1.vpc_id
  vpc_id        = vpc2.vpc_id
  auto_accept   = true

  tags = {
    Name = "peering-connection"
  }
}
