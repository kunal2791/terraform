#variable "VPC_CIDR" {
#  description = "vpc cidr range"
#}
variable "vpc_id" {
  default = "vpc id"
}

variable "PRIVATE_SUBNET_ZONE_CIDR" {
  type = "list"
}

variable "PUBLIC_SUBNET_ZONE_CIDR" {
  type = "list"
}

variable "AVAILABLITY_ZONE" {
  description = "availablity zone for public region"
  type        = "list"
}

variable "Name" {
  description = "name of your STACK"
}

variable "ENV" {
  description = "STACK id"
}

variable "Project" {
  description = "STACK type"
}

variable "Owner" {
  description = "STACKID"
}

variable "route_table_private" {}

variable "route_table_public" {}

variable "private_subnet_count" {}

variable "public_subnet_count" {}
