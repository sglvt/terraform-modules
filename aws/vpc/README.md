

## Description
Create a VPC with an internet gateway, public and/or private subnets, route tables, nat gateways, elastic IPs.

[Example](https://github.com/serbangilvitu/terraform-examples/tree/master/aws/vpc)

## Module variables

`aws_region` AWS region to use

`stack_name` Stack name

`cidr_vpc` The CIDR block of the VPC

`public_subnets` Map of availability zones and CIDR blocks of public subnets

`private_subnets` Map of availability zones and CIDR blocks of private subnets

`create_nat_gateways` Flag which determines whether NAT gateways will be created in public subnets

`nat_gateway_az` List of availability zones where NAT gateways should be created

`additional_tags` Map of additional tags to be added

`igw_routes_for_public_subnets` Public Subnets - List of destination CIDRs for routes passing through the Internet gateway

`nat_routes_for_private_subnets` Private Subnets - List of destination CIDRs for routes passing through the NAT gateways