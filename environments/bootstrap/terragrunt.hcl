terraform {
  source = "../../modules/bootstrap"
}

inputs = read_terragrunt_config(find_in_parent_folders("inputs.tfvars"))