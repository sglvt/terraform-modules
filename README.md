# aws

## vpc

Create a VPC with an internet gateway, public and/or private subnets, route tables, nat gateways, elastic IPs.

[README](https://github.com/serbangilvitu/terraform-modules/tree/master/aws/vpc/README.md)
[Example](https://github.com/serbangilvitu/terraform-examples/tree/master/aws/vpc)

## security-group

Creates a security group.

[Example](https://github.com/serbangilvitu/terraform-modules/tree/master/aws/security-group)

## eks-node-group

Creates the following resources for a node group which can be part of an AWS EKS cluster:
* IAM role
* Launch template
* Autoscaling group

[Example](https://github.com/serbangilvitu/terraform-examples/tree/master/aws/eks-public)