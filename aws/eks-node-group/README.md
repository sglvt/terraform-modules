

## Description
Creates the following resources for a node group which can be part of an AWS EKS cluster:
* IAM role
* Launch template
* Autoscaling group

[Example](https://github.com/serbangilvitu/terraform-examples/tree/master/aws/eks-public)

## Module variables

`cluster_name` EKS cluster name

`ebs_optimized` The ebs_optimized attribute of the launch configuration

`instance_type` The instance_type attribute of the launch configuration

`associate_public_ip_address` The associate_public_ip_address attribute of the launch configuration

`key_name` The key_name attribute of the launch configuration

`eks_version` The version of the EKS cluster

`subnet_ids` The list of subnet ids

`max_size` EKS node group - on-demand - max size

`min_size` EKS node group - on-demand - min size

`security_groups` The list of subnets for the asg

`endpoint` EKS Endpoint

`cluster_auth_base64` EKS cluster auth data

`stack_name` Stack Name

`additional_tags` Map of additional tags to be added


`on_demand_base_capacity` Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances

`on_demand_percentage_above_base_capacity` Percentage split between on-demand and Spot instances above the base on-demand capacity

`spot_allocation_strategy` Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances

`spot_instance_pools` Absolute minimum amount of desired capacity that must be fulfilled by on-demand instances

`spot_max_price` EC2 spot price

`pre_userdata` User data before bootstrap.sh

`bootstrap_extra_args` Extra arguments for bootstrap.sh

`kubelet_extra_args` Arguments to be used for --kubelet-extra-args

`additional_userdata` User data after bootstrap.sh