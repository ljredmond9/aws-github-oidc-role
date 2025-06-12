# aws-github-oidc-role

Terraform module for creating an AWS IAM role for GitHub Actions using OIDC authentication. The created IAM role can be 
assumed by GitHub Actions workflows to access AWS resources securely without needing to manage long-lived credentials.

## Prerequisites

The AWS account must have the OIDC provider for GitHub Actions configured ([Adding the identity provider to AWS](https://docs.github.com/en/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services#adding-the-identity-provider-to-aws)).

## Details

The role is configured with a trust policy that only allows workflows from a specific GitHub repository to assume it.
This is configured by the `repository_name` and `repo_name` variables.

By default, the role has no permissions attached. Policies can be attached to the role using one or both of the 
`policy_arns` and `inline_policies` variables.

The role name must be provided via the `role_name` variable.

The module outputs the IAM role ARN through the `role_arn` output variable.