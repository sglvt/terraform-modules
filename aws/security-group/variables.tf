variable "vpc_id" {
  type = string
  description = "The id of the VPC where the security group needs to be created"
}

# Ingress

variable "ingress_cidr_list" {
  type    = list(string)
  description = "List of concatenated ports, protocols, CIDR (IPv4) blocks used for inbound rules"
  default = []
}

variable "ingress_from_self_list" {
  type    = list(string)
  description = "List of concatenated ports, protocols from the same SG used for inbound rules"
  default = []
}

variable "ingress_ipv6_cidr_list" {
  type    = list(string)
  description = "List of concatenated ports, protocols, CIDR (IPv6) blocks used for inbound rules"
  default = []
}

variable "ingress_prefix_list_ids" {
  type    = list(string)
  description = "List of concatenated ports, protocols, prefix list ids used for inbound rules"
  default = []
}

variable "ingress_source_sg_list" {
  type    = list(string)
  description = "List of concatenated ports, protocols, source SGs used for inbound rules"
  default = []
}

# Egress

variable "egress_cidr_list" {
  type    = list(string)
  description = "List of concatenated ports, protocols, CIDR (IPv4) blocks used for outbound rules"
  default = [ "0,0,-1,0.0.0.0/0" ]
}

variable "egress_ipv6_cidr_list" {
  type    = list(string)
  description = "List of concatenated ports, protocols, CIDR (IPv6) blocks used for outbound rules"
  default = []
}

variable "egress_prefix_list_ids" {
  type    = list(string)
  description = "List of concatenated ports, protocols, prefix list ids used for outbound rules"
  default = []
}

variable "egress_source_sg_list" {
  type    = list(string)
  description = "List of concatenated ports, protocols, source sgs used for outbound rules"
  default = []
}

variable "stack_name" {
  type = string
  description = "Stack Name"
}

variable "name_prefix" {
  type = string
  description = "Name prefix for the security group"
}

variable "description" {
  type = string
  description = "Description of the security group"
}


variable "additional_tags" {
  type    = map(string)
  description = "Additional tags to be added"
}