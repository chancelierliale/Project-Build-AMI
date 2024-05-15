
terraform {
  backend "s3" {
    bucket         = "700-dev-s5-homework-tf-state"
    key            = "module/s5/group-work/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "700-dev-s5-homework-tf-state-lock"
  }
}



## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
