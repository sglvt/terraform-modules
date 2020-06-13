resource "aws_security_group" "security_group" {
  name = var.name
  description = var.description
  vpc_id = var.vpc_id

//  Ingress - TCP
  dynamic "ingress" {
    for_each = var.tcp_ingress

    content {
      from_port = ingress.key
      to_port = ingress.key
      protocol = "TCP"
      cidr_blocks = split(",", ingress.value)
    }

  }


//  Ingress - UDP
  dynamic "ingress" {
    for_each = var.udp_ingress

    content {
      from_port = ingress.key
      to_port = ingress.key
      protocol = "UDP"
      cidr_blocks = split(",", ingress.value)
    }

  }


//  Ingress - Any Protocol
  dynamic "ingress" {
    for_each = var.any_ingress

    content {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks = split(",", ingress.value)
    }

  }

//  Egress - TCP
  dynamic "egress" {
    for_each = var.tcp_egress

    content {
      from_port = egress.key
      to_port = egress.key
      protocol = "TCP"
      cidr_blocks = split(",", egress.value)
    }

  }

//  Egress - UDP
  dynamic "egress" {
    for_each = var.udp_egress

    content {
      from_port = egress.key
      to_port = egress.key
      protocol = "UDP"
      cidr_blocks = split(",", egress.value)
    }

  }

//  Egress - Any Protocol
  dynamic "egress" {
    for_each = var.any_egress

    content {
      from_port = "0"
      to_port = "0"
      protocol = "-1"
      cidr_blocks = split(",", egress.value)
    }

  }

  tags = {
    Name = "external-ssh"
    stack_name = var.stack_name
  }
}
