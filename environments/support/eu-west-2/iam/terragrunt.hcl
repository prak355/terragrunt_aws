include {
  path = find_in_parent_folders("common/terragrunt.hcl")
}

terraform {
  source = "../../../modules/iam"
}

inputs = read_terragrunt_config("inputs.tfvars")
