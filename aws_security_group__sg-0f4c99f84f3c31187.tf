# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_security_group.sg-0f4c99f84f3c31187:
resource "aws_security_group" "sg-0f4c99f84f3c31187" {
  description = "security group for SageMaker notebook instance, training jobs and hosting endpoint"
  tags = {
    "Name" = "studiovpc-security-group"
  }
  tags_all = {
    "Name" = "studiovpc-security-group"
  }
  vpc_id = aws_vpc.vpc-0068c71bc314adf60.id

  timeouts {}
}
