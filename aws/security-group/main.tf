resource "aws_security_group" "security_group" {
  name_prefix = var.name_prefix
  description = var.description
  vpc_id = var.vpc_id

//  Ingress - Source SG
  dynamic "ingress" {
    for_each = var.ingress_source_sg_list

    content {
      from_port = element(split(",", ingress.value), 0)
      to_port = element(split(",", ingress.value), 1)
      protocol = element(split(",", ingress.value), 2)
      security_groups = [ element(split(",", ingress.value), 3) ]
    }

  }

//  Ingress - CIDR
  dynamic "ingress" {
    for_each = var.ingress_cidr_list

    content {
      from_port = element(split(",", ingress.value), 0)
      to_port = element(split(",", ingress.value), 1)
      protocol = element(split(",", ingress.value), 2)
      cidr_blocks = [ element(split(",", ingress.value), 3) ]
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
    }

  }

//  Egress - CIDR
  dynamic "egress" {
    for_each = var.egress_cidr_list

    content {
      from_port = element(split(",", egress.value), 0)
      to_port = element(split(",", egress.value), 1)
      protocol = element(split(",", egress.value), 2)
      cidr_blocks = [ element(split(",", egress.value), 3) ]
    }

  }

  tags = merge({
    Name = "${var.name_prefix}"
  }, var.additional_tags)
}

//  Ingress - Self
resource "aws_security_group_rule" "ingress_self" {
  for_each = toset(var.ingress_from_self_list)

  from_port = element(split(",", each.value), 0)
  to_port = element(split(",", each.value), 1)
  protocol = element(split(",", each.value), 2)
  description = element(split(",", each.value), 3)
  security_group_id = aws_security_group.security_group.id
  source_security_group_id = aws_security_group.security_group.id
  type = "ingress"
}