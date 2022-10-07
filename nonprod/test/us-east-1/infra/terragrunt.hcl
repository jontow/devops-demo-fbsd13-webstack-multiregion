include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "${get_terragrunt_dir()}/../../../../modules/infra"
}

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  env = local.environment_vars.locals.environment
  app = "fbsd13-webstack"
}

inputs = {
  vpc_name       = "${local.env}-${local.app}-vpc"
  vpc_cidr_block = "10.193.0.0/20"
  vpc_azs        = {
    "us-east-1a" = "10.193.0.0/24"
    "us-east-1b" = "10.193.1.0/24"
    "us-east-1c" = "10.193.2.0/24"
  }

  lb_name    = "${local.env}-${local.app}-lb"
  lb_tg_name = "${local.env}-${local.app}-http80"
}
