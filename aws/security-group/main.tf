resource "aws_security_group" "security_group" {
  name_prefix = var.name_prefix
  description = var.description
  vpc_id = var.vpc_id

//  Ingress - CIDR IPv4
  dynamic "ingress" {
    for_each = var.ingress_cidr_list

    content {
      from_port = element(split(",", ingress.value), 0)
      to_port = element(split(",", ingress.value), 1)
      protocol = element(split(",", ingress.value), 2)
      cidr_blocks = [ element(split(",", ingress.value), 3) ]
      description = element(split(",", ingress.value), 4)
    }

  }

//  Ingress - Self
  dynamic "ingress" {
    for_each = var.ingress_from_self_list

    content {
      from_port = element(split(",", ingress.value), 0)
      to_port = element(split(",", ingress.value), 1)
      protocol = element(split(",", ingress.value), 2)
      description = element(split(",", ingress.value), 3)
      self = true
    }

  }

//  Ingress - CIDR IPv6
  dynamic "ingress" {
    for_each = var.ingress_ipv6_cidr_blocks

    content {
      from_port = element(split(",", ingress.value), 0)
      to_port = element(split(",", ingress.value), 1)
      protocol = element(split(",", ingress.value), 2)
      ipv6_cidr_blocks = [ element(split(",", ingress.value), 3) ]
      description = element(split(",", ingress.value), 4)
    }

  }


//  Ingress - Prefix List Ids
  dynamic "ingress" {
    for_each = var.ingress_prefix_list_ids

    content {
      from_port = element(split(",", ingress.value), 0)
      to_port = element(split(",", ingress.value), 1)
      protocol = element(split(",", ingress.value), 2)
      prefix_list_ids = [ element(split(",", ingress.value), 3) ]
      description = element(split(",", ingress.value), 4)
    }

  }

//  Ingress - Source SG
  dynamic "ingress" {
    for_each = var.ingress_source_sg_list

    content {
      from_port = element(split(",", ingress.value), 0)
      to_port = element(split(",", ingress.value), 1)
      protocol = element(split(",", ingress.value), 2)
      security_groups = [ element(split(",", ingress.value), 3) ]
      description = element(split(",", ingress.value), 4)
    }

  }

//  Egress - CIDR IPv4
  dynamic "egress" {
    for_each = var.egress_cidr_list

    content {
      from_port = element(split(",", egress.value), 0)
      to_port = element(split(",", egress.value), 1)
      protocol = element(split(",", egress.value), 2)
      cidr_blocks = [ element(split(",", egress.value), 3) ]
      description = element(split(",", egress.value), 4)
    }

  }

//  Egress - CIDR IPv6
  dynamic "egress" {
    for_each = var.egress_ipv6_cidr_blocks

    content {
      from_port = element(split(",", egress.value), 0)
      to_port = element(split(",", egress.value), 1)
      protocol = element(split(",", egress.value), 2)
      ipv6_cidr_blocks = [ element(split(",", egress.value), 3) ]
      description = element(split(",", egress.value), 4)
    }

  }

//  Egress - Prefix List Ids
  dynamic "egress" {
    for_each = var.egress_prefix_list_ids

    content {
      from_port = element(split(",", egress.value), 0)
      to_port = element(split(",", egress.value), 1)
      protocol = element(split(",", egress.value), 2)
      prefix_list_ids = [ element(split(",", egress.value), 3) ]
      description = element(split(",", egress.value), 4)
    }

  }

//  Egress - Source SG
  dynamic "egress" {
    for_each = var.egress_source_sg_list

    content {
      from_port = element(split(",", egress.value), 0)
      to_port = element(split(",", egress.value), 1)
      protocol = element(split(",", egress.value), 2)
      security_groups = [ element(split(",", egress.value), 3) ]
      description = element(split(",", egress.value), 4)
    }

  }

  tags = merge({
    Name = "${var.name_prefix}"
  }, var.additional_tags)
}
