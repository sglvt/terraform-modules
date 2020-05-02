resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_block_vpc

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

resource "aws_route" "public_external_access" {
  route_table_id = aws_vpc.vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

# Public Subnets

module "public_subnet_a" {
  source = "./subnet"
  vpc_id = aws_vpc.vpc.id
  subnet_name = "public-subnet-a"
  availability_zone = "${var.aws_region}a"
  cidr_block = var.cidr_block_public_subnet_a
  public_subnet = true
  stack_name = var.stack_name
  additional_tag = var.additional_tag
  route_table_id = aws_vpc.vpc.main_route_table_id
  cluster_name = var.cluster_name
}

module "public_subnet_b" {
  source = "./subnet"
  vpc_id = aws_vpc.vpc.id
  subnet_name = "public-subnet-b"
  availability_zone = "${var.aws_region}b"
  cidr_block = var.cidr_block_public_subnet_b
  public_subnet = true
  stack_name = var.stack_name
  additional_tag = var.additional_tag
  route_table_id = aws_vpc.vpc.main_route_table_id
  cluster_name = var.cluster_name
}

module "public_subnet_c" {
  source = "./subnet"
  vpc_id = aws_vpc.vpc.id
  subnet_name = "public-subnet-c"
  availability_zone = "${var.aws_region}c"
  cidr_block = var.cidr_block_public_subnet_c
  public_subnet = true
  stack_name = var.stack_name
  additional_tag = var.additional_tag
  route_table_id = aws_vpc.vpc.main_route_table_id
  cluster_name = var.cluster_name
}

# EIP
resource "aws_eip" "eip_a" {
  tags = {
    Name = "nat-a"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_eip" "eip_b" {
  tags = {
    Name = "nat-b"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_eip" "eip_c" {
  tags = {
    Name = "nat-c"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

# NAT Gateways
resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.eip_a.id
  subnet_id = module.public_subnet_a.id

  tags = {
    Name = "nat-a"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.eip_b.id
  subnet_id = module.public_subnet_b.id

  tags = {
    Name = "nat-b"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_nat_gateway" "nat_c" {
  allocation_id = aws_eip.eip_c.id
  subnet_id = module.public_subnet_c.id

  tags = {
    Name = "nat-c"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

# Private Route Tables

resource "aws_route_table" "private_rt_a" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_a.id
  }

  tags = {
    Name = "private-a"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_route_table" "private_rt_b" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_b.id
  }

  tags = {
    Name = "private-b"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_route_table" "private_rt_c" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_c.id
  }

  tags = {
    Name = "private-c"
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}


# Private Subnets

module "private_subnet_a" {
  source = "./subnet"
  vpc_id = aws_vpc.vpc.id
  subnet_name = "private-subnet-a"
  availability_zone = "${var.aws_region}a"
  cidr_block = var.cidr_block_private_subnet_a
  public_subnet = false
  stack_name = var.stack_name
  additional_tag = var.additional_tag
  route_table_id = aws_route_table.private_rt_a.id
  cluster_name = var.cluster_name
}

module "private_subnet_b" {
  source = "./subnet"
  vpc_id = aws_vpc.vpc.id
  subnet_name = "private-subnet-b"
  availability_zone = "${var.aws_region}b"
  cidr_block = var.cidr_block_private_subnet_b
  public_subnet = false
  stack_name = var.stack_name
  additional_tag = var.additional_tag
  route_table_id = aws_route_table.private_rt_b.id
  cluster_name = var.cluster_name
}

module "private_subnet_c" {
  source = "./subnet"
  vpc_id = aws_vpc.vpc.id
  subnet_name = "private-subnet-c"
  availability_zone = "${var.aws_region}c"
  cidr_block = var.cidr_block_private_subnet_c
  public_subnet = false
  stack_name = var.stack_name
  additional_tag = var.additional_tag
  route_table_id = aws_route_table.private_rt_c.id
  cluster_name = var.cluster_name
}
