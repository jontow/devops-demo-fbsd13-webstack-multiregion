variable "vpc_name" {
  type    = string
  default = "fbsd13-webstack-vpc"
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_azs" {
  type = map(any)
}

variable "lb_name" {
  type    = string
  default = "fbsd13-webstack-lb"
}

variable "lb_type" {
  type    = string
  default = "application"
}

variable "lb_listener_port" {
  type    = number
  default = 80
}

variable "lb_listener_protocol" {
  type    = string
  default = "HTTP"
}

variable "lb_tg_name" {
  type    = string
  default = "fbsd13-webstack-http80"
}

variable "lb_tg_port" {
  type    = number
  default = 80
}

variable "lb_tg_protocol" {
  type    = string
  default = "HTTP"
}
