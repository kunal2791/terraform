variable "vpc_id" {
  description = "vpc"
}
variable "target_port" {
  description = "Int(optional, 80): The port of which targets receive traffic"
  default     = 80
}
variable "target_protocol" {
  description = "String(optional, \"HTTP\"): The protocol to sue for routing traffic to the targets"
  default     = "HTTP"
}
variable "target_deregistration_delay" {
  description = "Int(optional, 30): The time in seconds before deregistering the target"
  default     = 30
}
variable "target_stickiness" {
  description = "List(optional, []): An ALB target_group stickiness block"
  type        = "list"
  default     = [{
    type = "lb_cookie"
  }]
}
variable "target_type" {
  description = "The type of target that you must specify when registering targets with this target group. The possible values are instance (targets are specified by instance ID) or ip (targets are specified by IP address). The default is instance"
  default     = "instance"
}
variable "target_health_interval" {
  description = "Int(optional, 30): Time in seconds between target health checks"
  default     = 30
}

variable "target_health_path" {
  description = "String(optional, \"/\"): Path for the health check request"
  default     = "/"
}

variable "target_health_timeout" {
  description = "Int(optional, 5): Time in seconds to wait for a successful health check response"
  default     = 5
}

variable "target_health_healthy_threshold" {
  description = "Int(optional, 5): The number of consecutive health checks successes before considering a target healthy"
  default     = 5
}

variable "target_health_unhealthy_threshold" {
  description = "Int(optional, 2): The number of consecutive health check failures before considering a target unhealthy"
  default     = 2
}

variable "target_health_matcher" {
  description = "Int(optional, 200): The HTTP codes to use when checking for a successful response from a target"
  default     = 200
}

variable "target_health_protocol" {
  description = "String(optional): The protocol to use for the health check. If not set, it will use the same protocal as target_protocol"
  default     = ""
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
variable "tg_instance_port" {
  default = "5672"
}
