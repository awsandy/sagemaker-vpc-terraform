resource "aws_security_group_rule" "sg-0f4c99f84f3c31187_egress_1" {
  type              = "egress"
  security_group_id = aws_security_group.sg-0f4c99f84f3c31187.id
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  description = ""
  from_port   = 0
  protocol    = "-1"
  to_port     = 0
}
