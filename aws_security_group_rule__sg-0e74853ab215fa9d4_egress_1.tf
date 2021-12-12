resource "aws_security_group_rule" "sg-0e74853ab215fa9d4_egress_1" {
  type              = "egress"
  security_group_id = aws_security_group.sg-0e74853ab215fa9d4.id
  cidr_blocks = [
    "0.0.0.0/0",
  ]
  description = ""
  from_port   = 0
  protocol    = "-1"
  to_port     = 0
}
