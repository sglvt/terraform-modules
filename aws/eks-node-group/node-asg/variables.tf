variable "cluster_name" {
  type = string
  description = "EKS cluster name"
}

variable "on_demand_desired_size" {
  type = string
  description = "EKS node group - on-demand - desired size"
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

variable "spot_price" {
  type = string
  description = "EC2 spot price"
}

variable "stack_name" {
  type = string
  description = "Stack Name"
}


variable "additional_tags" {
  type    = map(string)
  description = "Additional tags to be added"
}