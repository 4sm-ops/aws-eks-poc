# Node Group One

resource "aws_security_group" "node_group_one" {
  name_prefix = "node_group_one"
  vpc_id      = module.vpc.vpc_id

}

resource "aws_security_group_rule" "node_group_one_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = [
      "10.0.0.0/8",
    ]

  security_group_id = aws_security_group.node_group_one.id
}

resource "aws_security_group_rule" "node_group_one_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = [
      "10.0.0.0/8",
    ]
  security_group_id = aws_security_group.node_group_one.id
}

resource "aws_security_group_rule" "node_group_one_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = [
      "10.0.0.0/8",
    ]
  security_group_id = aws_security_group.node_group_one.id
}

resource "aws_security_group_rule" "node_group_one_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = [
      "10.0.0.0/8",
    ]
  security_group_id = aws_security_group.node_group_one.id
}

# Node Group Two

resource "aws_security_group" "node_group_two" {
  name_prefix = "node_group_two"
  vpc_id      = module.vpc.vpc_id

}

resource "aws_security_group_rule" "node_group_two_out" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = [
      "192.168.0.0/16",
    ]

  security_group_id = aws_security_group.node_group_two.id
}

resource "aws_security_group_rule" "node_group_two_in_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = [
      "192.168.0.0/16",
    ]
  security_group_id = aws_security_group.node_group_two.id
}

resource "aws_security_group_rule" "node_group_two_in_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = [
      "192.168.0.0/16",
    ]
  security_group_id = aws_security_group.node_group_two.id
}

resource "aws_security_group_rule" "node_group_two_in_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = [
      "192.168.0.0/16",
    ]
  security_group_id = aws_security_group.node_group_two.id
}