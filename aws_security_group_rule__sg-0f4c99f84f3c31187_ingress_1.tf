resource "aws_security_group_rule" "sg-0f4c99f84f3c31187_ingress_1" {
  type              = "ingress"
  security_group_id = aws_security_group.sg-0f4c99f84f3c31187.id
  description       = ""
  from_port         = 0
  protocol          = "-1"
  self              = true
  to_port           = 0
}
