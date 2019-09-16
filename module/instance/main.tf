#############################################
#           Instance                       #
############################################
resource "aws_instance" "instance" {
  ami           = "${lookup(var.ami, var.region)}"
  instance_type = "${var.instance_type}"
  subnet_id = "${data.aws_subnet_ids.subnet-private.ids,count.index}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  disable_api_termination = "${var.disable_api_termination}"
  #subnet_id = "${element(split(",", lookup(var.instance_subnets, var.aws_account)), count.index)}"
  key_name = "${var.ssh_key}"
  count    = "${var.instance_count}"
  #iam_instance_profile   = "${var.aws_iam}"
  vpc_security_group_ids = ["${var.security_group}", "${var.common_ssh_sg}"]

  #user_data = "${data.template_file.init.rendered}"
  root_block_device {
    volume_type           = "gp2"
    volume_size           = "${var.volume_size}"
    delete_on_termination = "true"
  }

  tags {
    Name       = "${var.Purpose}-${var.Env}"
    Env        = "${var.Env}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
    Purpose    = "${var.Purpose}"
    #TakeBackup = "${var.TakeBackup}"
  }

  volume_tags {
    Name       = "${var.Purpose}-${var.Env}"
    Env        = "${var.Env}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
    Purpose    = "${var.Purpose}"
    #TakeBackup = "${var.TakeBackup}"
  }
}
