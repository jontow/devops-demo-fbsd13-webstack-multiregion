variable "vpc_name" {
  type = string
}

variable "lb_tg_name" {
  type = string
}

variable "ec2_ami_owner" {
  type = string
}

variable "ec2_ami_name" {
  type = string
}

variable "ec2_app_server_count" {
  type = number
}

variable "ec2_app_server_port" {
  type = number
}

variable "ec2_instance_type" {
  type = string
}

variable "ec2_key_name" {
  type = string
}

variable "ec2_name_prefix" {
  type = string
}

variable "ec2_name_suffix" {
  type = string
}

variable "ec2_sg_name" {
  type = string
}
