variable "region" {
  description = "The AWS region"
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "The OIDC issuer URL of the EKS cluster"
  type        = string
}

variable "kubeconfig_host" {
  description = "The API server endpoint of the EKS cluster"
  type        = string
}

variable "kubeconfig_token" {
  description = "The authentication token for accessing the EKS cluster"
  type        = string
}

variable "kubeconfig_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  type        = string
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# Add-on Toggles
variable "enable_load_balancer_controller" {
  description = "Enable ALB Load Balancer Controller"
  type        = bool
  default     = true
}

variable "enable_prometheus" {
  description = "Enable Prometheus"
  type        = bool
  default     = true
}

variable "enable_grafana" {
  description = "Enable Grafana"
  type        = bool
  default     = true
}

variable "enable_argocd" {
  description = "Enable ArgoCD"
  type        = bool
  default     = true
}

variable "enable_ebs_csi_driver" {
  description = "Enable EBS CSI Driver"
  type        = bool
  default     = true
}

variable "enable_metrics_server" {
  description = "Enable Metrics Server"
  type        = bool
  default     = true
}

variable "enable_aws_secrets_manager" {
  description = "Enable AWS Secrets Manager integration"
  type        = bool
  default     = true
}
