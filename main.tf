provider "aws" {
    region = "eu-central-1"
    profile = "tv-ro"
}

module "instance" {
  source                       = "./module/instance"
  vpc_id                       = "${var.vpc_id}"
  region                       = "${var.AWS_REGION}"
  Name                         = "${var.Purpose}-${var.Env}"
  subnet_type                  = "${var.subnet_type}"
  Env                          = "${var.Env}"
  Project                      = "${var.Project}"
  Owner                        = "${var.Owner}"
  Purpose                      = "${var.Purpose}"
  ami                          = "${var.ami}"
  ssh_key                      = "${var.ssh_key}"
  instance_count               = "${var.instance_count}"
  instance_type                = "${var.instance_type}"
  volume_size                  = "${var.volume_size}"
  # private_subnet_ids           = ["${var.private_subnet_ids}"]
  # public_subnet_ids            = ["${var.public_subnet_ids}"]
  AVAILABLITY_ZONE             = "${var.AVAILABLITY_ZONE}"
  common_ssh_sg                = "${var.common_ssh_sg}"
  #aws_iam                      = "${module.iam.aws_iam}"
  security_group               = "${module.sg.security_group}"

  entity                       = "${var.entity}"
}
module "sg" {
  source                         = "./module/sg"
  port                           = "${var.port}"
  vpc_id                         = "${var.vpc_id}"
  cidr_blocks                    = "${var.cidr_blocks}"
  Name                           = "${var.Purpose}-${var.Env}"
  Env                            = "${var.Env}"
  Project                        = "${var.Project}"
  Purpose                        = "${var.Purpose}"
  Owner                          = "${var.Owner}"
  #Instance_sg                    = "${var.Instance_sg}"
}

# module "vpc" {
#   source = "./module/vpc"

#   #VPC_CIDR                  = "${var.VPC_CIDR}"
#   vpc_id                   = "${var.vpc_id}"
#   AVAILABLITY_ZONE         = "${var.AVAILABLITY_ZONE}"
#   PRIVATE_SUBNET_ZONE_CIDR = ["${var.PRIVATE_SUBNET_ZONE_CIDR}"]
#   private_subnet_count     = "${var.private_subnet_count}"
#   public_subnet_count      = "${var.public_subnet_count}"
#   PUBLIC_SUBNET_ZONE_CIDR  = ["${var.PUBLIC_SUBNET_ZONE_CIDR}"]terraform providers
#   route_table_private      = "${var.route_table_private}"
#   route_table_public       = "${var.route_table_public}"
#   Name                     = "${var.Name}"
#   ENV                      = "${var.ENV}"
#   Project                  = "${var.ENV}"
#   Owner                    = "${var.Owner}"
# }

# module "ebslp" {
#   source       = "./module/ebslp"
#   lifecycle_policy_interval = "${var.lifecycle_policy_interval}"
#   lifecycle_tag = "${var.lifecycle_tag}"
#   snapshot_to_retain = "${var.snapshot_to_retain}"
# }

# module "iam" {
#   source  = "./module/iam"
#   Name    = "${var.Name}"
#   ENV     = "${var.ENV}"
#   Project = "${var.Project}"
#   Owner   = "${var.Owner}"
#
#   #  POLICY_NAME2 = "${var.POLICY_NAME2}"
#   POLICY_NAME = "${var.POLICY_NAME}"
#   role_name   = "${var.role_name}"
# }

# module "storage" {
#   source          = "./module/storage"
#   s3_bucket_name  = "${var.s3_bucket_name}"
#   s3_bucket2_name = "${var.s3_bucket2_name}"
#
#   # s3_secound_bucket_name = "${var.s3_secound_bucket_name}"
#   Name    = "${var.Name}"
#   ENV     = "${var.ENV}"
#   Project = "${var.Project}"
#   Owner   = "${var.Owner}"
# }

/*module "r53" {
   source = "./module/r53"
   STACK = "${var.STACK}"
   STACKID = "${var.STACKID}"
   instance_count = "${var.instance_count}"
   r53_private_id  = "${var.r53_private_id}"
   is_private_r53 = "${var.is_private_r53}"
   aws_instance_ip = ["${module.instance.aws_instance_ip}"]
   #public_subnet_ids = ["${element(module.vpc.public_subnet_ids,1)}"]
   }
*/
