resource "aws_lb" "lb" {
  name               = "${var.Purpose}-${var.Env}-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = "${data.aws_subnet_ids.subnet-public.id}"

  enable_deletion_protection = true

  tags = {
    Name       = "${var.Purpose}-${var.Env}-lb"
    Env        = "${var.Env}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
    Purpose    = "${var.Purpose}"
  }
}
