data "aws_ami" "eks_worker" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "amazon-eks-node-${var.eks_version}-*"]
  }

  filter {
    name = "virtualization-type"
    values = [
      "hvm"]
  }

  owners = [
    "602401143452"]
}

resource "aws_launch_template" "eks_worker" {
  name_prefix = "eks"
  image_id = data.aws_ami.eks_worker.id
  instance_type = var.instance_type
  user_data = base64encode(templatefile("${path.module}/eks_worker.sh.tpl", {
    pre_userdata = var.pre_userdata,
    cluster_auth_base64 = var.cluster_auth_base64,
    endpoint = var.endpoint,
    bootstrap_extra_args = var.bootstrap_extra_args,
    kubelet_extra_args = var.kubelet_extra_args,
    cluster_name = var.cluster_name,
    additional_userdata = var.additional_userdata
  }))

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip_address
    security_groups =  var.security_groups
  }

  iam_instance_profile {
    name = var.iam_instance_profile
  }

  ebs_optimized = var.ebs_optimized
  key_name = var.key_name
}