aws_config = {
  region = "us-east-1"
}
vpc = {
  cidr_block = "10.192.0.0/20"
  azs = {
    "us-east-1a" = "10.192.0.0/24"
    "us-east-1b" = "10.192.1.0/24"
    "us-east-1c" = "10.192.2.0/24"
  }
  vpc_name = "fbsd13-webstack-vpc"
}

lb = {
  lb_name              = "fbsd13-webstack-lb"
  lb_type              = "network"
  lb_listener_port     = 80
  lb_listener_protocol = "TCP"
  tg_name              = "fbsd13-webstack-http"
  tg_port              = 80
  tg_protocol          = "TCP"
}

ec2 = {
  name_prefix      = "fbsd13-app"
  name_suffix      = "-nova"
  instance_type    = "t3a.micro"
  key_name         = "aws1-mototowne-keypair"
  ami_owner        = "679593333241"
  ami_name         = "FreeBSD 13.1-RELEASE-amd64 UEFI-ac170f9b-f71a-458c-ac8e-1bf96b74e270"
  app_server_count = 2
  app_server_port  = 8080
  sg_name          = "fbsd13-webstack-sg"
}
