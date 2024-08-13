role_name       = "preprod-eks-role"
policy_name     = "preprod-eks-policy"
policy_document = "path/to/policy.json"

tags = {
  Environment = "preprod"
  Project     = "your-project-name"
}
