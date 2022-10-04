variable "vpc_name" {
  type = string
}

variable "vpc_cidr_block" {
  type = string
}

variable "vpc_azs" {
  type = map
}

variable "alb_name" {
  type = string
}

variable "alb_tg_name" {
  type = string
}
