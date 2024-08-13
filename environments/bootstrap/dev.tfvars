region         = "eu-west-2"
s3_bucket_name = "terraform-state-dev"
dynamodb_table = "terraform-locks-dev"

tags = {
  Environment = "dev"
  Project     = "your-project-name"
}
