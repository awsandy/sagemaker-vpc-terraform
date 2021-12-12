##
# sg-0ab91e0265b90016e
##
data "aws_security_group" "sm-inbound" {
  vpc_id = aws_sagemaker_domain.mydomain.vpc_id
  name   = format("security-group-for-inbound-nfs-%s", aws_sagemaker_domain.mydomain.id)
}


##
# sg-0083004b97b205475
##
data "aws_security_group" "sm-outbound" {
  vpc_id = aws_sagemaker_domain.mydomain.vpc_id
  name   = format("security-group-for-outbound-nfs-%s", aws_sagemaker_domain.mydomain.id)
}

