bucket_name   = "preprod-bucket"
versioning    = true
sse_algorithm = "AES256"

tags = {
  Environment = "preprod"
  Project     = "your-project-name"
}
