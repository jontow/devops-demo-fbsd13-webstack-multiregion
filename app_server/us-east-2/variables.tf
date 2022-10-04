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

variable ec2 {
  type = object({
    name_prefix      = string
    name_suffix      = string
    instance_type    = string
    key_name         = string
    ami_owner        = string
    ami_name         = string
    app_server_count = number
    sg_name          = string
  })
}
