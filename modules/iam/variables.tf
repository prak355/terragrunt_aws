variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "policy_name" {
  description = "The name of the IAM policy"
  type        = string
}

variable "policy_document" {
  description = "Path to the policy document"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
