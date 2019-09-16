data "aws_subnet_ids" "subnet-public" {
 vpc_id = "${var.vpc_id}"
 filter {
   name   = "tag:access_type"
   values = ["${var.subnet_type}"]
 }

 # filter {
 #   name   = "tag:az"
 #   values = ["${element(var.AVAILABLITY_ZONE,count.index)}"]
 # }

 filter {
   name   = "tag:entity"
   values = ["${var.entity}"]
 }
 filter {
   name   = "tag:env"
   values = ["${var.Env}"]
 }
}
