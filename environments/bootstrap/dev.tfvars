region         = "eu-west-2"
s3_bucket_name = "dev-terraform-state-mb""
dynamodb_table = "dev-terraform-lock-table"

tags = {
  Environment = "dev"
  Project     = "Dev Infra"
}
