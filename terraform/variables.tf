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

variable "admin_cidr" {
    description = "CIDR admin"
}

variable "log_destination" {
  description = "arn IAM role della destinazione log"
}

variable "traffic_type" {
  description = "Tipo di traffico: ACCEPT, REJECT, ALL."
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic for CloudWatch alarms"
}

variable "email_sns" {
  description = "email dove inviare alert"
}

variable "ami_id" {}

variable "instance_type" {}

variable "security_group_id" {}