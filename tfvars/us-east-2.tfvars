aws_config = {
  region = "us-east-2"
}
vpc = {
  cidr_block = "10.192.16.0/20"
  azs = {
    "us-east-2a" = "10.192.16.0/24"
    "us-east-2b" = "10.192.17.0/24"
    "us-east-2c" = "10.192.18.0/24"
  }
  vpc_name = "fbsd13-webstack-vpc"
}

alb = {
  alb_name = "fbsd13-webstack-lb"
  tg_name  = "fbsd13-webstack-http"
}

ec2 = {
  name_prefix      = "fbsd13-app"
  name_suffix      = "-ohio"
  instance_type    = "t3a.micro"
  key_name         = "aws1-mototowne-keypair"
  ami_owner        = "679593333241"
  ami_name         = "FreeBSD 13.1-RELEASE-amd64 UEFI-ac170f9b-f71a-458c-ac8e-1bf96b74e270"
  app_server_count = 2
  sg_name          = "fbsd13-webstack-sg"
}