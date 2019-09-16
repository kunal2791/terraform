resource "aws_lb_target_group" "target" {
  name                 = "${var.Purpose}-${var.Env}-tg"
  vpc_id               = "${var.vpc_id}"
  port                 = "${var.target_port}"
  protocol             = "${var.target_protocol}"
  deregistration_delay = "${var.target_deregistration_delay}"
  stickiness           = ["${var.target_stickiness}"]
  target_type          = "${var.target_type}"

  health_check {
    interval            = "${var.target_health_interval}"
    path                = "${var.target_health_path}"
    timeout             = "${var.target_health_timeout}"
    healthy_threshold   = "${var.target_health_healthy_threshold}"
    unhealthy_threshold = "${var.target_health_unhealthy_threshold}"
    matcher             = "${var.target_health_matcher}"
    protocol            = "${var.target_health_protocol == "" ? var.target_protocol : var.target_health_protocol}"
  }

  tags {
    Name       = "${var.Purpose}-${var.Env}-tg"
    Env        = "${var.Env}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
    Purpose    = "${var.Purpose}"

  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "test" {
  target_group_arn = "${aws_lb_target_group.target.arn}"
  target_id        = "${aws_instance.test.id}"
  port             = "${var.tg_instance_port}"
}
