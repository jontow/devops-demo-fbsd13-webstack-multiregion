variable "vpc" {
  type = object({
    vpc_name   = string
    cidr_block = string
    azs        = map(string)
  })
}

variable "lb" {
  type = object({
    lb_name              = string
    lb_type              = string
    lb_listener_port     = number
    lb_listener_protocol = string
    tg_name              = string
    tg_port              = number
    tg_protocol          = string
  })
}
