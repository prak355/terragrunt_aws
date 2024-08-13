cluster_name      = "prod-eks-cluster1"
cluster_version   = "1.24"

node_groups = {
  ng1 = {
    desired_capacity = 3
    max_capacity     = 5
    min_capacity     = 2
    instance_type    = "m5.large"
  },
  ng2 = {
    desired_capacity = 4
    max_capacity     = 6
    min_capacity     = 3
    instance_type    = "m5.xlarge"
  }
}

tags = {
  Environment = "prod"
  Project     = "your-project-name"
}
