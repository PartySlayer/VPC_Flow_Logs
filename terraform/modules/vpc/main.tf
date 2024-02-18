resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.public_subnet_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[0]

  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr_block
  availability_zone = data.aws_availability_zones.available_zones.names[1]

  tags = {
    Name = "${var.vpc_name}-private-subnet"
  }
}

resource "aws_network_acl" "nacl" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-nacl"
  }
}

resource "aws_network_acl_association" "public_nacl_association" {
  subnet_id      = aws_subnet.public_subnet.id
  network_acl_id = aws_network_acl.nacl.id
}

resource "aws_network_acl_association" "private_nacl_association" {
  subnet_id      = aws_subnet.private_subnet.id
  network_acl_id = aws_network_acl.nacl.id
}