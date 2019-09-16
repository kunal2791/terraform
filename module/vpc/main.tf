resource "aws_subnet" "public_subnet" {
  vpc_id = "${var.vpc_id}"
  count  = "${var.public_subnet_count}"

  #cidr_block        = ["${var.PUBLIC_SUBNET_ZONE_CIDR}"]
  cidr_block        = "${element(var.PUBLIC_SUBNET_ZONE_CIDR,count.index)}"
  availability_zone = "${element(var.AVAILABLITY_ZONE, count.index)}"

  tags {
    Name       = "${var.Name}-public"
    Decription = "${var.Name} vpc public subnet with direct access to internet gateway"
    Env        = "${var.ENV}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
  }
}

########################################
#          PUBLIC SUBNET              #
#######################################
resource "aws_subnet" "private_subnet" {
  vpc_id = "${var.vpc_id}"
  count  = "${var.private_subnet_count}"

  #cidr_block        = ["${var.PRIVATE_SUBNET_ZONE_CIDR}"]
  cidr_block = "${element(var.PRIVATE_SUBNET_ZONE_CIDR,count.index)}"

  #availability_zone = "${var.AVAILABLITY_ZONE}"
  availability_zone = "${element(var.AVAILABLITY_ZONE, count.index)}"

  tags {
    Name       = "${var.Name}-private"
    Decription = "${var.Name} vpc public subnet with direct access to internet gateway"
    Env        = "${var.ENV}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id = "${element(aws_subnet.private_subnet.*.id, count.index)}"

  #  "${element(aws_subnet.subnets.*.id, count.index)}"
  route_table_id = "${var.route_table_private}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${var.route_table_public}"
}
