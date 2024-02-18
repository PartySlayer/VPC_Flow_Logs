# check / test

output "admin_cidr" {
  value = var.admin_cidr
}

output "nacl_name" {
  value = aws_network_acl.nacl.Name
}