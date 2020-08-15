module "node_role" {
  source = "./node-role"
  cluster_name = var.cluster_name
}

module "node_launch_template" {
  source = "./node-launch-template"
  eks_version = var.eks_version
  cluster_auth_base64 = var.cluster_auth_base64
  endpoint = var.endpoint
  key_name = var.key_name
  cluster_name = var.cluster_name
  instance_type = var.instance_type
  iam_instance_profile = module.node_role.profile_name
  associate_public_ip_address = var.associate_public_ip_address
  ebs_optimized = "true"
  security_groups = var.security_groups
  spot_price = var.spot_price
  stack_name = var.stack_name
  additional_tags = var.additional_tags
}

module "node_asg" {
  source = "./node-asg"
  cluster_name = var.cluster_name
  launch_template = module.node_launch_template.launch_template
  on_demand_desired_size = var.on_demand_desired_size
  max_size = var.max_size
  min_size = var.min_size
  subnet_ids = var.subnet_ids
  spot_price = var.spot_price
  stack_name = var.stack_name
  additional_tags = var.additional_tags
}