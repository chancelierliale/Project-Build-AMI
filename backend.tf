
terraform {
  backend "s3" {
    bucket         = "700-dev-s5-homework-tf-state"
    key            = "vpc/s5/group-work/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "700-dev-s5-homework-tf-state-lock"
  }
}
