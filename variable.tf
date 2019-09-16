variable "AWS_REGION" {
  description = "aws region"
}

# variable "Name" {
#   description = "name of your STACK"
# }

variable "Env" {
  description = "STACK id"
}

variable "Project" {
  description = "STACK type"
}

variable "Purpose" {
  description = "STACK type"
}

variable "Owner" {
  description = "STACKID"
}

##
## VPC VARIABLES CONFIGURATIIONS
##
variable "vpc_id" {}

variable "port" {
  # type = "list"
}

variable "cidr_blocks" {
  description = "sg_cidr"
  type        = "list"
}

variable "ami" {
  type = "map"

  default = {
    "ap-southeast-1" = "ami-0b84d2c53ad5250c2"
    "eu-west-1"      = "ami-0b5b6c7f"
    "us-west-1"      = "ami-3bcc9e7e"
    "us-west-2"      = "ami-52ff7262"
    "us-east-1"      = "ami-c6699baf"
    "eu-central-1"   = "ami-04bbd81b8f84131fa"
  }
}

variable "ssh_key" {
  description = "The ssh key which will be used to login"
}

variable "volume_size" {
  description = "The size of volume"
}

variable "instance_type" {
  description = "Server Instance type"
}

variable "AVAILABLITY_ZONE" {
  type = "list"
}
variable "instance_count" {
  default = ""
}
# variable "public_subnet_ids" {
#   description = "Set all public subnet"
#   type        = "list"
# }

# variable "private_subnet_ids" {
#   description = "Set all private subnet"
#   type        = "list"
# }

variable "common_ssh_sg" {
  default = ""
}
variable "associate_public_ip_address" {
 default = "false"
}
variable "disable_api_termination" {
 default = "false"
}

variable "entity" {
  default = ""
}
variable "subnet_type" {
  default = ""
}

variable "certificate_arn" {
  default = ""
}
