include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../modules/app_server"
}

dependencies {
  paths = ["../infra"]
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  env = local.environment_vars.locals.environment
  app = "fbsd13-webstack"
}

inputs = {
  vpc_name = "${local.env}-${local.app}-vpc"
  lb_tg_name = "${local.env}-${local.app}-http80"

  ec2_sg_name     = "${local.env}-${local.app}-sg"
  ec2_key_name    = "aws1-mototowne-keypair"
  ec2_name_prefix = "${local.env}-fbsd13-app"
  ec2_name_suffix = "-nova"

  ec2_app_server_count = 2
}
