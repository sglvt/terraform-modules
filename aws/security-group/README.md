# Usage

Full example can be found [here](https://github.com/serbangilvitu/terraform-examples/tree/v1.0.3/aws/vpc-sg)

The following security group contains all rule types (CIDR IPv4, CIDR IPv6, self, source security group).

If these are omitted, they will default to an empty list, with the exception of the outbound CIDR IPv4 which will allow all traffic if not specified, as it will default to `"0,0,-1,0.0.0.0/0,Allow any"`

```
module "sg_a" {
  source = "git::https://github.com/serbangilvitu/terraform-modules.git//aws/security-group?ref=v1.2.6"
  name_prefix = "${var.stack_name}-a"
  description = "Example a"
  vpc_id = module.vpc.id

  ingress_cidr_list = var.sg_a_ingress_cidr_list
  ingress_from_self_list = var.sg_a_ingress_from_self_list
  ingress_ipv6_cidr_list = var.sg_a_ingress_ipv6_cidr_list
  ingress_prefix_list_ids = var.sg_a_ingress_prefix_list_ids
  ingress_source_sg_list = var.sg_a_ingress_source_sg_list

  egress_cidr_list = var.sg_a_egress_cidr_list
  egress_from_self_list = var.sg_a_egress_from_self_list
  egress_ipv6_cidr_list = var.sg_a_egress_ipv6_cidr_list
  egress_prefix_list_ids = var.sg_a_egress_prefix_list_ids
  egress_source_sg_list = var.sg_a_egress_source_sg_list

  stack_name = var.stack_name
  additional_tags = var.additional_tags
}
```

and sample values

```
sg_a_ingress_from_self_list = [ "80,80,tcp,Allow HTTP" ]

sg_a_ingress_cidr_list = [ 
    "443,443,tcp,0.0.0.0/0,Allow HTTPS", 
    "22,22,tcp,10.0.32.0/20,Allow SSH"
]
```