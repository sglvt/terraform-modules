variable "vpc_id" {
  type = string
  description = "The id of the VPC where the security group needs to be created"
}

variable "subnet_name" {
  type = string
  description = "The name of the subnet"
}

variable "availability_zone" {
  type = string
  description = "The AZ of the subnet"
}

variable "route_table_id" {
  type = string
  description = "The route table id"
}

variable "cidr_block" {
  type = string
  description = "The CIDR block of the subnet"
}

variable "public_subnet" {
  type = string
  description = "Flag which determines whether the subnet is public"
}

variable "cluster_name" {
  type = string
  description = "The EKS cluster name"
  default = ""
}

variable "stack_name" {
  type = string
  description = "Stack Name"
}

variable "additional_tag" {
  type = string
  description = "The name of the SRE candidate"
}
