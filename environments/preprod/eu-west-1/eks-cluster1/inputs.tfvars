cluster_name      = "preprod-eks-cluster1"
cluster_version   = "1.24"

node_groups = {
  ng1 = {
    desired_capacity = 2
    max_capacity     = 3
    min_capacity     = 1
    instance_type    = "m5.large"
  },
  ng2 = {
    desired_capacity = 2
    max_capacity     = 4
    min_capacity     = 1
    instance_type    = "m5.xlarge"
  }
}

tags = {
  Environment = "preprod"
  Project     = "your-project-name"
}
