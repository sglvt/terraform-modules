resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc

  tags = merge({
    Name = var.stack_name
  }, var.additional_tags)
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = merge({
    Name = var.stack_name
  }, var.additional_tags)
}

resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets

  vpc_id = aws_vpc.vpc.id
  availability_zone = "${var.aws_region}${each.key}"
  cidr_block = each.value
  map_public_ip_on_launch = true

  tags = merge({
    Name = "${var.stack_name}-public-${each.key}"
  }, var.additional_tags)
}


resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.vpc.id

  dynamic "route" {
    for_each = var.igw_routes_for_public_subnets

    content {
      cidr_block = route.value
      gateway_id = aws_internet_gateway.igw.id
    }
  }

  tags = merge({
    Name = "${var.stack_name}-public"
  }, var.additional_tags)
}

resource "aws_route_table_association" "public_route_associations" {
  for_each = var.public_subnets

  subnet_id = aws_subnet.public_subnets[each.key].id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_eip" "eip" {
  for_each = toset(var.nat_gateway_az)

  tags = merge({
    Name = "${var.stack_name}-${each.key}"
  }, var.additional_tags)
}

resource "aws_nat_gateway" "nat_gateways" {
  for_each = toset(var.nat_gateway_az)
  allocation_id = aws_eip.eip[each.key].id
  subnet_id = aws_subnet.public_subnets[each.key].id

  tags = merge({
    Name = "${var.stack_name}-${each.key}"
  }, var.additional_tags)
}

resource "aws_subnet" "private_subnets" {
  for_each = var.private_subnets

  vpc_id = aws_vpc.vpc.id
  availability_zone = "${var.aws_region}${each.key}"
  cidr_block = each.value
  map_public_ip_on_launch = false

  tags = merge({
    Name = "${var.stack_name}-private-${each.key}"
  }, var.additional_tags)
}


resource "aws_route_table" "private_routes" {
  for_each = toset(var.nat_gateway_az)
  vpc_id = aws_vpc.vpc.id

  dynamic "route" {
    for_each = var.nat_routes_for_private_subnets

    content {
      cidr_block = route.value
      nat_gateway_id = aws_nat_gateway.nat_gateways[each.key].id
    }
  }

  tags = merge({
    Name = "${var.stack_name}-private-${each.key}"
  }, var.additional_tags)
}

resource "aws_route_table_association" "private_route_associations" {
  for_each = toset(var.nat_gateway_az)

  subnet_id = aws_subnet.private_subnets[each.key].id
  route_table_id = aws_route_table.private_routes[each.key].id
}