resource "aws_instance" "ec2" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  subnet_id       = module.vpc.public_subnet_id
  security_groups = [var.security_group_id]
}