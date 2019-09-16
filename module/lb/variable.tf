variable "vpc_id" {
  description = "vpc"
}

variable "region" {
  description = "AWS region Name"
}

# variable "public_subnet_ids" {
#   description = "Set all public subnet"
#   type        = "list"
# }

variable "Name" {
  description = "name of your STACK"
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

variable "subnet_type" {
  default = ""
}
variable "entity" {
  default = ""
}

variable "certificate_arn" {
  default = ""
}
