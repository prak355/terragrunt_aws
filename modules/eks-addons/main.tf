terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "kubernetes" {
  host                   = var.kubeconfig_host
  token                  = var.kubeconfig_token
  cluster_ca_certificate = base64decode(var.kubeconfig_certificate_authority_data)
}

provider "helm" {
  kubernetes {
    host                   = var.kubeconfig_host
    token                  = var.kubeconfig_token
    cluster_ca_certificate = base64decode(var.kubeconfig_certificate_authority_data)
  }
}

module "load_balancer_controller" {
  source = "../eks-addons"

  cluster_name                = var.cluster_name
  cluster_identity_oidc_issuer = var.cluster_oidc_issuer_url
  region                      = var.region

  enable = var.enable_load_balancer_controller

  tags = var.tags
}

module "prometheus" {
  source = "../eks-addons"

  cluster_name = var.cluster_name
  region       = var.region

  enable = var.enable_prometheus

  tags = var.tags
}

module "grafana" {
  source = "../eks-addons"

  cluster_name = var.cluster_name
  region       = var.region

  enable = var.enable_grafana

  tags = var.tags
}

module "argocd" {
  source = "../eks-addons"

  cluster_name = var.cluster_name
  region       = var.region

  enable = var.enable_argocd

  tags = var.tags
}

module "ebs_csi_driver" {
  source = "../eks-addons"

  cluster_name = var.cluster_name
  region       = var.region

  enable = var.enable_ebs_csi_driver

  tags = var.tags
}

module "metrics_server" {
  source = "../eks-addons"

  cluster_name = var.cluster_name
  region       = var.region

  enable = var.enable_metrics_server

  tags = var.tags
}

module "aws_secrets_manager" {
  source = "../eks-addons"

  cluster_name = var.cluster_name
  region       = var.region

  enable = var.enable_aws_secrets_manager

  tags = var.tags
}

resource "kubernetes_service" "argocd" {
  metadata {
    name      = "argocd-server"
    namespace = "argocd"
    labels = {
      app = "argocd"
    }
  }

  spec {
    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 8080
      protocol    = "TCP"
      name        = "http"
    }

    selector = {
      app = "argocd-server"
    }
  }

  depends_on = [module.argocd]
}

resource "kubernetes_service" "grafana" {
  metadata {
    name      = "grafana"
    namespace = "monitoring"
    labels = {
      app = "grafana"
    }
  }

  spec {
    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 3000
      protocol    = "TCP"
      name        = "http"
    }

    selector = {
      app = "grafana"
    }
  }

  depends_on = [module.grafana]
}

resource "kubernetes_service" "prometheus" {
  metadata {
    name      = "prometheus"
    namespace = "monitoring"
    labels = {
      app = "prometheus"
    }
  }

  spec {
    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 9090
      protocol    = "TCP"
      name        = "http"
    }

    selector = {
      app = "prometheus"
    }
  }

  depends_on = [module.prometheus]
}
