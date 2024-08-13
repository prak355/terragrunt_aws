variable "region" {
  description = "The AWS region"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID for the EKS cluster"
  type        = string
}

variable "subnets" {
  description = "A list of subnet IDs"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "node_groups" {
  description = "A map defining node groups"
  type        = map(any)
  default     = {}
}

variable "instance_type" {
  description = "Instance type for Bottlerocket nodes"
  type        = string
  default     = "m5.large"
}

variable "volume_size" {
  description = "EBS volume size for Bottlerocket nodes"
  type        = number
  default     = 20
}
