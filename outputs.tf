output "home_efs_file_system_id" {
  value = aws_sagemaker_domain.mydomain.home_efs_file_system_id
}

output "domain_id" {
  value = aws_sagemaker_domain.mydomain.id
}

output "vpc_id" {
  value = aws_vpc.vpc-0068c71bc314adf60.id
}

output "sg-sm-inbound" {
  value = data.aws_security_group.sm-inbound.id
}

output "sg-sm-outbound" {
  value = data.aws_security_group.sm-outbound.id
}