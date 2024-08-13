cluster_name      = "preprod-eks-cluster2"
cluster_version   = "1.24"

node_groups = {
  ng1 = {
    desired_capacity = 3
    max_capacity     = 5
    min_capacity     = 2
    instance_type    = "m5.large"
  }
}

tags = {
  Environment = "preprod"
  Project     = "your-project-name"
}
