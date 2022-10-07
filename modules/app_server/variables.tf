variable "vpc_name" {
  type    = string
  default = "fbsd13-webstack-vpc"
}

variable "lb_tg_name" {
  type    = string
  default = "fbsd13-webstack-http80"
}

variable "ec2_ami_owner" {
  type    = string
  default = "679593333241"
}

variable "ec2_ami_name" {
  type    = string
  default = "FreeBSD 13.1-RELEASE-amd64 UEFI-ac170f9b-f71a-458c-ac8e-1bf96b74e270"
}

variable "ec2_app_server_count" {
  type    = number
  default = 1
}

variable "ec2_app_server_port" {
  type    = number
  default = 8080
}

variable "ec2_instance_type" {
  type    = string
  default = "t3a.micro"
}

variable "ec2_key_name" {
  type = string
}

variable "ec2_name_prefix" {
  type    = string
  default = "fbsd13-app"
}

variable "ec2_name_suffix" {
  type = string
}

variable "ec2_sg_name" {
  type    = string
  default = "fbsd13-webstack-sg"
}
