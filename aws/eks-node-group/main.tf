module "node_role" {
  source = "./node-role"
  cluster_name = var.cluster_name
}

module "node_launch_template" {
  source = "./node-launch-template"
  cluster_name = var.cluster_name
  eks_version = var.eks_version
  cluster_auth_base64 = var.cluster_auth_base64
  endpoint = var.endpoint
  security_groups = var.security_groups
  key_name = var.key_name
  instance_type = var.instance_type
  iam_instance_profile = module.node_role.profile_name
  associate_public_ip_address = var.associate_public_ip_address
  ebs_optimized = var.ebs_optimized
  spot_max_price = var.spot_max_price
  pre_userdata = var.pre_userdata
  bootstrap_extra_args = var.bootstrap_extra_args
  kubelet_extra_args = var.kubelet_extra_args
  additional_userdata = var.additional_userdata
  stack_name = var.stack_name
  additional_tags = var.additional_tags
}

module "node_asg" {
  source = "./node-asg"
  cluster_name = var.cluster_name
  launch_template = module.node_launch_template.id
  max_size = var.max_size
  min_size = var.min_size
  subnet_ids = var.subnet_ids

  on_demand_base_capacity = var.on_demand_base_capacity
  on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
  spot_allocation_strategy = var.spot_allocation_strategy
  spot_instance_pools = var.spot_instance_pools
  spot_max_price = var.spot_max_price

  stack_name = var.stack_name
  additional_tags = var.additional_tags
}