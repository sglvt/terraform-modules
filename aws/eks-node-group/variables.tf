variable "cluster_name" {
  type = string
  description = "EKS cluster name"
}

variable "ebs_optimized" {
  type = string
  description = "The ebs_optimized attribute of the launch configuration"
}

variable "instance_type" {
  type = string
  description = "The instance_type attribute of the launch configuration"
}

variable "associate_public_ip_address" {
  type = string
  description = "The associate_public_ip_address attribute of the launch configuration"
}

variable "key_name" {
  type = string
  description = "The key_name attribute of the launch configuration"
}

variable "eks_version" {
  type = string
  description = "The version of the EKS cluster"
}

variable "subnet_ids" {
  type = list(string)
  description = "The list of subnet ids"
}

variable "max_size" {
  type = string
  description = "EKS node group - on-demand - max size"
}

variable "min_size" {
  type = string
  description = "EKS node group - on-demand - min size"
}

variable "security_groups" {
  type = list(string)
  description = "The list of subnets for the asg"
}

variable "endpoint" {
  type = string
  description = "EKS Endpoint"
}

variable "cluster_auth_base64" {
  type = string
  description = "EKS cluster auth data"
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

variable "pre_userdata" {
  type = string
  description = "User data before bootstrap.sh"
  default = ""
}

variable "bootstrap_extra_args" {
  type = string
  description = "Extra arguments for bootstrap.sh"
  default = ""
}

variable "kubelet_extra_args" {
  type = string
  description = "Arguments to be used for --kubelet-extra-args"
  default = ""
}

variable "additional_userdata" {
  type = string
  description = "User data after bootstrap.sh"
  default = ""
}