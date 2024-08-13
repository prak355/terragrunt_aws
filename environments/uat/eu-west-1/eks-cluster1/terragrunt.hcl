include {
  path = find_in_parent_folders("common/terragrunt.hcl")
}

dependency "vpc" {
  config_path = "../vpc"
}

terraform {
  source = "../../../modules/eks"
}

inputs = merge(
  {
    vpc_id  = dependency.vpc.outputs.vpc_id
    subnets = dependency.vpc.outputs.public_subnet_ids
  },
  read_terragrunt_config(find_in_parent_folders("env.tfvars")),
  read_terragrunt_config("inputs.tfvars")
)
