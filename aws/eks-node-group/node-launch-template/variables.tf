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

variable "spot_price" {
  type = string
  description = "EC2 spot price"
}

variable "eks_version" {
  type = string
  description = "The version of the EKS cluster"
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

variable "iam_instance_profile" {
  type = string
  description = "EKS node - IAM Instance Profile"
}

variable "stack_name" {
  type = string
  description = "Stack Name"
}

variable "additional_tags" {
  type    = map(string)
  description = "Additional tags to be added"
}