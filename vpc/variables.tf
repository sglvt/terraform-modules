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
  description = "Additional tag"
}


variable "cidr_vpc" {
  type = string
  description = "The CIDR block of the VPC"
}

variable "public_subnets" {
  type    = map(string)
  default = {
    "a" = "10.0.0.0/24"
  }
}

variable "private_subnets" {
  type    = map(string)
  default = {
    "a" = "10.100.0.0/24"
  }
}