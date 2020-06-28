provider "aws" {
  version = "~> 2.0"
  region  = var.aws_region
//  assume_role {
//    role_arn = var.admin_role_arn
//  }
}
variable "aws_region" {}
