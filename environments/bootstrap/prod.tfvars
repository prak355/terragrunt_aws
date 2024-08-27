region         = "eu-west-2"
s3_bucket_name = "prod-terraform-state-mb"
dynamodb_table = "prod-terraform-lock-table"

tags = {
  Environment = "prod"
  Project     = "Prod Infra"
}
