#main file for vpc infrastructrue automation
#a vpc with public-private subnets and NAT gateway with elastic IP
/*
resource "aws_vpc" "vpc" {
  cidr_block           = "${var.VPC_CIDR}"
  enable_dns_hostnames = true

  tags {
    Name    = "${var.Name} VPC"
    Env     = "${var.ENV}"
    Project = "${var.Project}"
    Owner   = "${var.Owner}"
  }
}

# creating internet gateway for public subnet
resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags {
    Name    = "${var.Name} VPC"
    Env     = "${var.ENV}"
    Project = "${var.Project}"
    Owner   = "${var.Owner}"
  }
}

#elastic IP for NAT gateway
resource "aws_eip" "zonea" {
  vpc = true
}

resource "aws_eip" "zoneb" {
  vpc = true
}
*/
#===========================================
#Public subnet configurations
resource "aws_subnet" "public_zonea" {
  vpc_id = "${var.vpc_id}"

  cidr_block        = "${var.PUBLIC_SUBNET_ZONEA_CIDR}"
  availability_zone = "${var.AVAILABLITY_ZONE_A}"

  tags {
    Name       = "${var.Name} public subnet ${var.AVAILABLITY_ZONE_A}"
    Env        = "${var.ENV}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
    Decription = "${var.Name} vpc public subnet with direct access to internet gateway"
  }
}

resource "aws_subnet" "public_zoneb" {
  vpc_id = "${var.vpc_id}"

  cidr_block        = "${var.PUBLIC_SUBNET_ZONEB_CIDR}"
  availability_zone = "${var.AVAILABLITY_ZONE_B}"

  tags {
    Name       = "${var.Name} public subnet ${var.AVAILABLITY_ZONE_B}"
    Decription = "${var.Name} vpc public subnet with direct access to internet gateway"
    Env        = "${var.ENV}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
  }
}

resource "aws_subnet" "public_zonec" {
  vpc_id = "${var.vpc_id}"

  cidr_block        = "${var.PUBLIC_SUBNET_ZONEC_CIDR}"
  availability_zone = "${var.AVAILABLITY_ZONE_C}"

  tags {
    Name       = "${var.Name} public subnet ${var.AVAILABLITY_ZONE_C}"
    Env        = "${var.ENV}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
    Decription = "${var.Name} vpc public subnet with direct access to internet gateway"
  }
}

#===========================================
#route table for public subnet
/*resource "aws_route_table" "zonea" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags {
    Name        = "${var.Name} ${var.AVAILABLITY_ZONE_B} route table public"
    Description = "${var.Name} vpc route table attached to internet gateway for public subnets"
    Env         = "${var.ENV}"
    Project     = "${var.Project}"
    Owner       = "${var.Owner}"
  }
}

resource "aws_route_table" "zoneb" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_internet_gateway.ig.id}"
  }

  tags {
    Name        = "${var.Name} ${var.AVAILABLITY_ZONE_B} route table public"
    Description = "${var.Name} vpc route table attached to internet gateway for public subnets"
    Env         = "${var.ENV}"
    Project     = "${var.Project}"
    Owner       = "${var.Owner}"
  }
}

#=============================================
# public route table association with public subnet
resource "aws_route_table_association" "zonea" {
  subnet_id      = "${aws_subnet.public_zonea.id}"
  route_table_id = "${aws_route_table.zonea.id}"
}

resource "aws_route_table_association" "zoneb" {
  subnet_id      = "${aws_subnet.public_zoneb.id}"
  route_table_id = "${aws_route_table.zoneb.id}"
}

#=============================================
# NAT gateway configurations
resource "aws_nat_gateway" "zonea" {
  allocation_id = "${aws_eip.zonea.id}"
  subnet_id     = "${aws_subnet.public_zonea.id}"
  depends_on    = ["aws_internet_gateway.ig"]
}

resource "aws_nat_gateway" "zoneb" {
  allocation_id = "${aws_eip.zoneb.id}"
  subnet_id     = "${aws_subnet.public_zoneb.id}"
  depends_on    = ["aws_internet_gateway.ig"]
}
*/
#=============================================
#Private Subnets configurations
#
resource "aws_subnet" "private_zonea" {
  vpc_id = "${var.vpc_id}"

  cidr_block        = "${var.PRIVATE_SUBNET_ZONEA_CIDR}"
  availability_zone = "${var.AVAILABLITY_ZONE_A}"

  tags {
    Name       = "${var.Name} private subnet ${var.AVAILABLITY_ZONE_A}"
    Decription = "${var.Name} vpc public subnet with direct access to internet gateway"
    Env        = "${var.ENV}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
  }
}

resource "aws_subnet" "private_zoneb" {
  vpc_id = "${var.vpc_id}"

  cidr_block        = "${var.PRIVATE_SUBNET_ZONEB_CIDR}"
  availability_zone = "${var.AVAILABLITY_ZONE_B}"

  tags {
    Name       = "${var.Name} private subnet ${var.AVAILABLITY_ZONE_B}"
    Decription = "${var.Name} vpc public subnet with direct access to internet gateway"
    Env        = "${var.ENV}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
  }
}

resource "aws_subnet" "private_zonec" {
  vpc_id = "${var.vpc_id}"

  cidr_block        = "${var.PRIVATE_SUBNET_ZONEC_CIDR}"
  availability_zone = "${var.AVAILABLITY_ZONE_C}"

  tags {
    Name       = "${var.Name} private subnet ${var.AVAILABLITY_ZONE_C}"
    Decription = "${var.Name} vpc public subnet with direct access to internet gateway"
    Env        = "${var.ENV}"
    Project    = "${var.Project}"
    Owner      = "${var.Owner}"
  }
}

#================================================
/*
resource "aws_route_table" "private_zonea" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.zonea.id}"
  }

  tags {
    Name        = "${var.Name} ${var.AVAILABLITY_ZONE_A} route table private"
    Description = "${var.Name} private route table for private subnets"
    Env         = "${var.ENV}"
    Project     = "${var.Project}"
    Owner       = "${var.Owner}"
  }
}

resource "aws_route_table" "private_zoneb" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.zoneb.id}"
  }

  tags {
    Name        = "${var.Name} ${var.AVAILABLITY_ZONE_B} route table private"
    Description = "${var.Name} private route table for private subnets"
    Env         = "${var.ENV}"
    Project     = "${var.Project}"
    Owner       = "${var.Owner}"
  }
}
*/
#================================================
#priavte route tabe association
resource "aws_route_table_association" "private" {
  subnet_id = "${element(aws_subnet.private_zonea.id, count.index)}"

  #  "${element(aws_subnet.subnets.*.id, count.index)}"
  route_table_id = "${var.route_table_private}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${element(aws_subnet.public_zonea.id, count.index)}"
  route_table_id = "${var.route_table_public}"
}

#================================================

