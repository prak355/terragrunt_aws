remote_state {
  backend = "s3"
  config = {
    bucket         = "terraform-state-${get_env("ENVIRONMENT", "dev")}"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks-${get_env("ENVIRONMENT", "dev")}"
    encrypt        = true
  }
}
