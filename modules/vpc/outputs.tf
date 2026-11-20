output "vpc_id" {
  value = aws_vpc.this.id
}

# Lists, so callers (e.g. the eks module) can take subnet_ids unchanged.
output "private_subnet_ids" {
  value = [aws_subnet.private.id]
}

output "public_subnet_ids" {
  value = [aws_subnet.public.id]
}

output "nat_gateway_public_ip" {
  value = aws_eip.nat.public_ip
}
