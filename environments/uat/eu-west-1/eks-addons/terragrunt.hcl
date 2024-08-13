include {
  path = find_in_parent_folders("common/terragrunt.hcl")
}

dependency "eks" {
  config_path = "../eks-cluster1"
}

terraform {
  source = "../../../modules/eks-addons"
}

inputs = merge(
  {
    cluster_name = dependency.eks.outputs.eks_cluster_name
    kubeconfig_host = dependency.eks.outputs.eks_cluster_endpoint
  },
  read_terragrunt_config(find_in_parent_folders("env.tfvars")),
  read_terragrunt_config("inputs.tfvars")
)
