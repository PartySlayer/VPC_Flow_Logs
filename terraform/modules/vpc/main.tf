resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id    = aws_vpc.vpc.id

  tags      = {
    Name    = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id       = aws_vpc.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags       = {
    Name     = "public rt"
  }
}

resource "aws_route_table_association" "public_subnet_route_table_association" {
  subnet_id           = aws_subnet.public_subnet.id
  route_table_id      = aws_route_table.public_route_table.id
}

data "aws_availability_zones" "available_zones" {}

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