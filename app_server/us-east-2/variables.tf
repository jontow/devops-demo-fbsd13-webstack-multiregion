variable vpc {
  type = object({
    vpc_name   = string
    cidr_block = string
    azs        = map(string)
  })
}

variable lb {
  type = object({
    lb_name = string
    lb_type = string
    tg_name = string
    tg_port = number
    tg_protocol = string
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
    app_server_port  = number
    sg_name          = string
  })
}
