resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_subnet" "public_subnets" {
  for_each = var.public_subnets

  vpc_id            = aws_vpc.vpc.id
  availability_zone = "${var.aws_region}${each.key}"
  cidr_block        = each.value
  map_public_ip_on_launch = true
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.stack_name}-public"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_route_table_association" "rt_associations" {
  for_each = var.public_subnets

  subnet_id = aws_subnet.public_subnets[each.key].id
  route_table_id = aws_route_table.public_rt.id
}
