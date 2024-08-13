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
  }
}

provider "aws" {
  region = var.region
}

module "eks_cluster" {
  source          = "../eks"
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  vpc_id          = var.vpc_id
  subnets         = var.subnets
  enable_irsa     = true

  node_groups = var.node_groups

  tags = var.tags
}

data "aws_ami" "bottlerocket" {
  most_recent = true
  owners      = ["679593333241"] # Bottlerocket AWS account ID
  filter {
    name   = "name"
    values = ["bottlerocket-*-x86_64-*"]
  }
}

resource "aws_launch_template" "bottlerocket" {
  name_prefix   = "${var.cluster_name}-bottlerocket"
  image_id      = data.aws_ami.bottlerocket.id
  instance_type = var.instance_type

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.volume_size
    }
  }
  
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(var.tags, {
    "Name" = "${var.cluster_name}-bottlerocket"
  })
}

output "eks_cluster_name" {
  value = module.eks_cluster.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}
