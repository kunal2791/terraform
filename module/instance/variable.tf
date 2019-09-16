variable "vpc_id" {
  description = "vpc"
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

variable "region" {
  description = "AWS region Name"
}

# variable "public_subnet_ids" {
#   description = "Set all public subnet"
#   type        = "list"
# }

variable "instance_type" {
  description = "Server Instance type"
}


variable "Name" {
  description = "name of your STACK"
}

variable "ssh_key" {
  description = "The ssh key which will be used to login"
}

variable "volume_size" {
  description = "The vaule of Envrinonment tag"
}

variable "Env" {
  description = "project environment"
}

variable "Project" {
  description = "project name"
}

variable "Purpose" {
  description = "Define purpose of instance"
}

variable "Owner" {
  description = "owner of the project"
}

variable "instance_count" {}

# variable "aws_iam" {
#   default = "none"
# }

variable "security_group" {
  default = ""
}

# variable "private_subnet_ids" {
#   type = "list"
# }

variable "AVAILABLITY_ZONE" {
  type = "list"
}

variable "common_ssh_sg" {
  default = "default sg for ssh"
}
variable "associate_public_ip_address" {
 default = "false"
}
variable "disable_api_termination" {
 default = "false"
}
variable "subnet_type" {
  default = ""
}
variable "entity" {
  default = ""
}
# variable "az" {
#   default = ""
# }
