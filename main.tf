data "aws_iam_openid_connect_provider" "github" {
  url = "https://token.actions.githubusercontent.com"
}

resource "aws_iam_role" "main" {
  name                = var.role_name
  managed_policy_arns = var.policy_arns

  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            Federated = data.aws_iam_openid_connect_provider.github.arn
          }
          Action = "sts:AssumeRoleWithWebIdentity"
          Condition = {
            StringEquals = {
              "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
            }
            StringLike = {
              "token.actions.githubusercontent.com:sub" = "repo:${var.organization_name}/${var.repo_name}:*"
            }
          }
        }
      ]
    }
  )
}

resource "aws_iam_role_policy" "inline" {
  for_each = var.inline_policies
  role     = aws_iam_role.main.id
  policy   = each.key
}

