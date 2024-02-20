# configurazione provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    region = var.region
    profile = "terraform"
  
}

# vpc

module "vpc" {
  source = "./modules/vpc"

  project_name               = var.project_name
  region                     = var.region
  vpc_cidr_block             = var.vpc_cidr_block  
  vpc_name                   = var.vpc_name
  public_subnet_cidr_block   = var.public_subnet_cidr_block
  private_subnet_cidr_block  = var.private_subnet_cidr_block
}

# NACL

module "nacl" {
  source = "./modules/nacl"

  vpc_name = var.vpc_name
  admin_cidr = var.admin_cidr
}

# ec2

module "ec2" {
  source = "./modules/ec2"

  ami_id            = module.ec2.ami_id 
  instance_type     = module.ec2.instance_type              
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = var.security_group_id   # Update with your desired security group ID
}

# Other configurations for your infrastructure

# VPC Flow Logs
module "vpc_flow_logs" {
  source = "./modules/vpc_flow_logs"

  log_destination  = var.log_destination # cloudwatch or s3
  traffic_type     = var.traffic_type
}

# sns

module "sns" {
  source = "./modules/sns"

  email_sns = var.email_sns
  
}

# cloudwatch

module "cloudwatch_monitoring" {
  source = "./modules/cloudwatch_monitoring"

  sns_topic_arn = module.sns.sns_topic_arn # passato tramite output
}