variable "vpc_id" {
  type = string
  description = "The id of the VPC where the security group needs to be created"
}

variable "tcp_ingress" {
  type    = map(string)
  description = "Map of ports and CIDR blocks used for TCP inbound rules"
}

variable "udp_ingress" {
  type    = map(string)
  description = "Map of ports and CIDR blocks used for UDP inbound rules"
}

variable "any_ingress" {
  type    = list(string)
  description = "List of CIDR blocks for All Traffic inbound rules"
}

variable "tcp_egress" {
  type    = map(string)
  description = "Map of ports and CIDR blocks used for TCP outbound rules"
}

variable "udp_egress" {
  type    = map(string)
  description = "Map of ports and CIDR blocks used for UDP outbound rules"
}

variable "any_egress" {
  type    = list(string)
  description = "List of CIDR blocks for All Traffic outbound rules"
}

variable "stack_name" {
  type = string
  description = "Stack Name"
}

variable "name" {
  type = string
  description = "Name of the security group"
}

variable "description" {
  type = string
  description = "Description of the security group"
}


variable "additional_tags" {
  type    = map(string)
  description = "Additional tags to be added"
}