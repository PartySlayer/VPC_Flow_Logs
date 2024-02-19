This module defines the VPC, internet gateway, routing table, public and private subnets.
It allows customization of CIDR blocks, VPC name, and availability zone through input variables.
Output variables provide the VPC ID, public subnet ID, and private subnet ID for consumption in other modules or the main configuration.

The VPC will be attached to Flow Logs for traffic monitoring.
