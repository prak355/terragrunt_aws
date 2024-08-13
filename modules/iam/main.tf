resource "aws_iam_role" "eks_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })

  tags = var.tags
}

resource "aws_iam_policy" "eks_policy" {
  name   = var.policy_name
  policy = file(var.policy_document)

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "eks_policy_attach" {
  role       = aws_iam_role.eks_role.name
  policy_arn = aws_iam_policy.eks_policy.arn
}

output "role_name" {
  value = aws_iam_role.eks_role.name
}

output "policy_arn" {
  value = aws_iam_policy.eks_policy.arn
}
