module "common" {
  source = "../common"

  vpc_name             = var.vpc.vpc_name
  lb_tg_name           = var.lb.tg_name
  ec2_ami_owner        = var.ec2.ami_owner
  ec2_ami_name         = var.ec2.ami_name
  ec2_app_server_count = var.ec2.app_server_count
  ec2_app_server_port  = var.ec2.app_server_port
  ec2_instance_type    = var.ec2.instance_type
  ec2_key_name         = var.ec2.key_name
  ec2_name_prefix      = var.ec2.name_prefix
  ec2_name_suffix      = var.ec2.name_suffix
  ec2_sg_name          = var.ec2.sg_name
}
