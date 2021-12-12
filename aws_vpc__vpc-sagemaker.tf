# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_vpc.vpc-0068c71bc314adf60:
resource "aws_vpc" "vpc-0068c71bc314adf60" {
  assign_generated_ipv6_cidr_block = false
  cidr_block                       = "10.2.0.0/16"
  enable_classiclink               = false
  enable_classiclink_dns_support   = false
  enable_dns_hostnames             = true
  enable_dns_support               = true
  instance_tenancy                 = "default"
  tags = {
    "Name" = "studiovpc-vpc"
  }
  tags_all = {
    "Name" = "studiovpc-vpc"
  }
}
