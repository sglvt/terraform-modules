resource "aws_subnet" "subnet" {
  vpc_id = var.vpc_id
  availability_zone = var.availability_zone
  cidr_block = var.cidr_block
  map_public_ip_on_launch = var.public_subnet

  tags = {
    Name = var.subnet_name
    "${var.cluster_name != "" ? "kubernetes.io/cluster/${var.cluster_name}" : "non-k8s-subnet"}" = var.cluster_name != "" ? "shared" : "true"
    # "kubernetes.io/cluster/${var.cluster_name}" = var.cluster_name != "" ? "shared" : ""
    stack_name = var.stack_name
    additional_tag = var.additional_tag
  }
}

resource "aws_route_table_association" "rt-association" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = var.route_table_id
}
