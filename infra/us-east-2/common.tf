module "common" {
  source = "../common"

  vpc_name       = var.vpc.vpc_name
  vpc_cidr_block = var.vpc.cidr_block
  vpc_azs        = var.vpc.azs
  alb_name       = var.alb.alb_name
  alb_tg_name    = var.alb.tg_name
}
