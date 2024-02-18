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