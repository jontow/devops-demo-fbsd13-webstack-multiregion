variable vpc {
  type = object({
    vpc_name   = string
    cidr_block = string
    azs        = map(string)
  })
}

variable alb {
  type = object({
    alb_name = string
    tg_name  = string
  })
}
