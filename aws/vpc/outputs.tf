output "id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_ids" {
  value = [for v in aws_subnet.public_subnets : v.id]
}

output "public_subnet_ids_by_az" {
  value = {for k,v in aws_subnet.public_subnets : k => v.id }
}

output "private_subnet_ids" {
  value = [for v in aws_subnet.private_subnets : v.id]
}

output "private_subnet_ids_by_az" {
  value = {for k,v in aws_subnet.private_subnets : k => v.id }
}

output "nat_gateway_public_eips" {
  value = [for v in aws_eip.nat_gateway_eips : v.public_ip]
}