variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable versioning"
  type        = bool
  default     = true
}

variable "sse_algorithm" {
  description = "The server-side encryption algorithm to use. AES256 is the default."
  type        = string
  default     = "AES256"
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
