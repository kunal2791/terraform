resource "aws_security_group" "instance" {
  name        = "${var.Purpose}"
  description = "sg for rabbitmq"

  #vpc_id = "${var.vpc_id}"
  vpc_id = "${var.vpc_id}"

  tags {
    Name       = "${var.Purpose}-${var.Env}${count.index}-sg"
    Env        = "${var.Env}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
    Purpose    = "${var.Purpose}"
  }

  #Access_RULE
  ingress {
    from_port   = "${var.port}"
    to_port     = "${var.port}"
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]
  }

  ingress {
    from_port   = 10050
    to_port     = 10050
    protocol    = "tcp"
    cidr_blocks = ["172.22.66.130/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
