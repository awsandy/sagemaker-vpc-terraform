# File generated by aws2tf see https://github.com/aws-samples/aws2tf
# aws_route_table_association.rtbassoc-0f69b41ab4423420d:
resource "aws_route_table_association" "rtbassoc-0f69b41ab4423420d" {
  route_table_id = aws_route_table.rtb-0cf252a93b44fe2c2.id
  subnet_id      = aws_subnet.subnet-0cdf0919b0826f4b7.id
}
