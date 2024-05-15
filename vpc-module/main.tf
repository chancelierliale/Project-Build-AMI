
provider "aws" {
  
  region = local.aws_region
}




locals {
  
  vpc_prefix-s5 = "/700/s5/vpc"

  common_tags = {
    "AssetID"       = "700"
    "AssetName"     = "s5-groupwork"
    "Environment"   = "dev-s5"
    "Project"       = "alpha"
    "CreateBy"      = "s5-groupwork"
    "cloudProvider" = "aws"
  }



  aws_region = "us-east-1"

  cidr_block                       = "10.0.0.0/16"
  instance_tenancy                 = "default"
  enable_dns_support               = true
  enable_dns_hostnames             = true
  
  assign_generated_ipv6_cidr_block = false

  cluster_name = "s5-groupwork"

  private_subnets_db = [
    "10.0.4.0/24",
    "10.0.5.0/24",
    "10.0.6.0/24",
  ]

  public = [
    "10.0.7.0/24",
    "10.0.8.0/24",
    "10.0.9.0/24",
  ]


  aws_availability_zones = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
  ]


  shared = "shared"


}





module "s5-vpc-module" {
  source = "../"
  vpc_prefix-s5 = local.vpc_prefix-s5
  common_tags = local.common_tags
  aws_region = local.aws_region
  cidr_block                       = local.cidr_block
  instance_tenancy                 = local.instance_tenancy
  enable_dns_support               = local.enable_dns_support
  enable_dns_hostnames             = local.enable_dns_hostnames
  assign_generated_ipv6_cidr_block = local.assign_generated_ipv6_cidr_block
  cluster_name = local.cluster_name
  private_subnets_db = local.private_subnets_db
  public = local.public
  aws_availability_zones = local.aws_availability_zones
 shared = local.shared

}