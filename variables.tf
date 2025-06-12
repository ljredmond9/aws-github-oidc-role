variable "role_name" {
  description = "The name to use for the IAM role"
  type        = string
}

variable "repositories" {
  description = "List of GitHub repositories (in format 'organization/repository') that can assume the role"
  type        = list(string)
  default     = []
}

variable "policy_arns" {
  description = "An optional list of IAM policy ARNs to attach to the role"
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "An optional list of inline policy documents to attach to the role"
  type        = list(string)
  default     = []
}