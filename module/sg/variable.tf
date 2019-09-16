variable "port" {
  description = "sg from port"
}

variable "cidr_blocks" {
  description = "sg_cidr"
  type        = "list"
}

variable "vpc_id" {
  description = "vpc"
}

variable "Name" {
  description = "name of your STACK"
}

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
