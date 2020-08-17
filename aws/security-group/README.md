## Description

Creates a security group.

[Example](https://github.com/serbangilvitu/terraform-examples/tree/master/aws/vpc-sg)

## Module variables

`vpc_id` The id of the VPC where the security group needs to be created

`stack_name` Stack Name

`name_prefix` Name prefix for the security group

`description` Description of the security group

`additional_tags` Map of additional tags to be added



`ingress_cidr_list` List of concatenated ports, protocols, CIDR (IPv4) blocks used for inbound rules

`ingress_from_self_list` List of concatenated ports, protocols from the same SG used for inbound rules

`ingress_ipv6_cidr_list` List of concatenated ports, protocols, CIDR (IPv6) blocks used for inbound rules

`ingress_prefix_list_ids` List of concatenated ports, protocols, prefix list ids used for inbound rules

`ingress_source_sg_list` List of concatenated ports, protocols, source SGs used for inbound rules



`egress_cidr_list` List of concatenated ports, protocols, CIDR (IPv4) blocks used for outbound rules

`egress_from_self_list` List of concatenated ports, protocols from the same SG used for outbound rules

`egress_ipv6_cidr_list` List of concatenated ports, protocols, CIDR (IPv6) blocks used for outbound rules

`egress_prefix_list_ids` List of concatenated ports, protocols, prefix list ids used for outbound rules

`egress_source_sg_list` List of concatenated ports, protocols, source sgs used for outbound rules