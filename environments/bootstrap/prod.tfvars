region         = "eu-west-2"
s3_bucket_name = "terraform-state-prod"
dynamodb_table = "terraform-locks-prod"

tags = {
  Environment = "prod"
  Project     = "your-project-name"
}
