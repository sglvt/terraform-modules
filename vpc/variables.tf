variable "aws_region" {
  type = string
  description = "AWS region to use"
}

variable "stack_name" {
  type = string
  description = "Stack name"
}

variable "additional_tag" {
  type = string
  description = "The name of the SRE candidate"
}


variable "cidr_block_vpc" {
  type = string
  description = "The CIDR block of the VPC"
}

variable "cidr_block_public_subnet_a" {
  type = string
  description = "The CIDR block of the public subnet in AZ a"
}

variable "cidr_block_public_subnet_b" {
  type = string
  description = "The CIDR block of the public subnet in AZ b"
}

variable "cidr_block_public_subnet_c" {
  type = string
  description = "The CIDR block of the public subnet in AZ c"
}

variable "cidr_block_private_subnet_a" {
  type = string
  description = "The CIDR block of the private subnet in AZ a"
}

variable "cidr_block_private_subnet_b" {
  type = string
  description = "The CIDR block of the private subnet in AZ b"
}

variable "cidr_block_private_subnet_c" {
  type = string
  description = "The CIDR block of the private subnet in AZ c"
}

variable "cluster_name" {
  type = string
  description = "The EKS cluster name"
  default = ""
}