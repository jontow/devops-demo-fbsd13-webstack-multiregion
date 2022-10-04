module "common" {
  source = "../common"

  vpc_name       = var.vpc.vpc_name
  vpc_cidr_block = var.vpc.cidr_block
  vpc_azs        = var.vpc.azs
  lb_name        = var.lb.lb_name
  lb_type        = var.lb.lb_type
  lb_listener_port = var.lb.lb_listener_port
  lb_listener_protocol = var.lb.lb_listener_protocol
  lb_tg_name     = var.lb.tg_name
  lb_tg_port     = var.lb.tg_port
  lb_tg_protocol = var.lb.tg_protocol
}
