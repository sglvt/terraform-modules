variable "cluster_name" {
  type = string
  description = "EKS cluster name"
}

variable "max_size" {
  type = string
  description = "EKS node group - on-demand - max size"
}

variable "min_size" {
  type = string
  description = "EKS node group - on-demand - min size"
}

variable "subnet_ids" {
  type = list(string)
  description = "The list of subnet ids"
}

variable "launch_template" {
  type = string
  description = "EKS node group - launch template"
}

variable "stack_name" {
  type = string
  description = "Stack Name"
}


variable "additional_tags" {
  type    = map(string)
  description = "Map of additional tags to be added"
}

# Mixed Instances Policy

variable "on_demand_base_capacity" {
  type = string
  description = "Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances"
}

variable "on_demand_percentage_above_base_capacity" {
  type = string
  description = "Percentage split between on-demand and Spot instances above the base on-demand capacity"
}

variable "spot_allocation_strategy" {
  type = string
  description = "Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances"
}

variable "spot_instance_pools" {
  type = string
  description = "Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances"
}

variable "spot_max_price" {
  type = string
  description = "EC2 spot price"
}