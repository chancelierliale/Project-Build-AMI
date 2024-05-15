variable "vpc_prefix-s5" {
  type    = string
  
}

variable "aws_region" {
  type = string
}

variable "common_tags" {
  type = map(any)
  
}


## VPC
variable "cidr_block" {
  type = string
}

variable "instance_tenancy" {
  type = string
}

variable "enable_dns_support" {
  type = bool
}

variable "enable_dns_hostnames" {
  type = bool
}

# variable "enable_classiclink" {
#   type = bool
# }

# variable "enable_classiclink_dns_support" {
#   type = bool
# }

variable "assign_generated_ipv6_cidr_block" {
  type = bool
}

variable "cluster_name" {
  type = string
}



variable "private_subnets_db" {
  type = list(any)
  
}

variable "public" {
  type = list(any)
  
}




variable "aws_availability_zones" {
  type = list(any)
  
}

variable "shared" {
  type    = string
 
}
