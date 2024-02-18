# variabili

variable "region" {
    description = "regione"
}

variable "project_name" {
    description = "nome progetto"
}

variable "vpc_cidr_block" {
  description = "CIDR VPC"
}

variable "vpc_name" {
  description = "nome VPC"
}

variable "public_subnet_cidr_block" {
  description = "CIDR subnet pubblica"
}

variable "private_subnet_cidr_block" {
  description = "CIDR subnet privata"
}
