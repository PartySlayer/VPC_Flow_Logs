resource "aws_network_acl" "nacl" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-nacl"
  }

# inbound rules
ingress { # allow SSH from admin only
  
  protocol   = "tcp"
  action     = "allow"
  cidr_block = var.admin_cidr
  from_port  = 22
  to_port    = 22
}

# outbound rules
egress { # allow all traffic
  
  protocol   = "-1"
  action     = "allow"
  cidr_block = "0.0.0.0/0"
  from_port  = 0
  to_port    = 65535  # on all ports
}
}

# association
resource "aws_network_acl_association" "public_nacl_association" {
  subnet_id      = aws_subnet.public_subnet.id
  network_acl_id = aws_network_acl.nacl.id
}

resource "aws_network_acl_association" "private_nacl_association" {
  subnet_id      = aws_subnet.private_subnet.id
  network_acl_id = aws_network_acl.nacl.id
}

