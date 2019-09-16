#variable "VPC_CIDR" {
#  description = "vpc cidr range"
#}
variable "vpc_id" {
  default = "vpc id"
}

variable "PUBLIC_SUBNET_ZONEA_CIDR" {
  description = "public subnet cidr range"
}

variable "PUBLIC_SUBNET_ZONEB_CIDR" {
  description = "public subnet cidr range"
}

variable "AVAILABLITY_ZONE_A" {
  description = "availablity zone for public region"
}

variable "AVAILABLITY_ZONE_B" {
  description = "availablity zone for public region"
}

variable "AVAILABLITY_ZONE_C" {
  description = "availablity zone for public region"
}

variable "PRIVATE_SUBNET_ZONEA_CIDR" {
  description = "private subnet cidr range"
}

variable "PRIVATE_SUBNET_ZONEB_CIDR" {
  description = "private subnet cidr range"
}

variable "PRIVATE_SUBNET_ZONEC_CIDR" {
  description = "private subnet cidr range"
}

variable "PUBLIC_SUBNET_ZONEC_CIDR" {
  description = "private subnet cidr range"
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
