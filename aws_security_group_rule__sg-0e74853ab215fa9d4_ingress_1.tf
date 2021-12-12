resource "aws_security_group_rule" "sg-0e74853ab215fa9d4_ingress_1" {
  type                     = "ingress"
  security_group_id        = aws_security_group.sg-0e74853ab215fa9d4.id
  description              = ""
  from_port                = 443
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.sg-0f4c99f84f3c31187.id
  to_port                  = 443
}
