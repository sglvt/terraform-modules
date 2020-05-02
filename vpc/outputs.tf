output "id" {
  value = aws_vpc.vpc.id
}

output "public_subnets" {
  value = list(module.public_subnet_a.id, module.public_subnet_b.id, module.public_subnet_c.id)
}

output "private_subnets" {
  value = list(module.private_subnet_a.id, module.private_subnet_b.id, module.private_subnet_c.id)
}

output "all_subnets" {
  value = list(module.public_subnet_a.id,
  module.public_subnet_b.id,
  module.public_subnet_c.id,
  module.private_subnet_a.id,
  module.private_subnet_b.id,
  module.private_subnet_c.id)
}

output "public_subnet_a" {
  value = module.public_subnet_a.id
}

output "public_subnet_b" {
  value = module.public_subnet_b.id
}

output "public_subnet_c" {
  value = module.public_subnet_c.id
}