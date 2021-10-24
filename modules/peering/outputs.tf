output "pc_id" {
  value = aws_vpc_peering_connection.pc.id
}

output "pc_accept_status" {
  value = aws_vpc_peering_connection.pc.accept_status
}
