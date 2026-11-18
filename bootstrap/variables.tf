variable "region" {
  type        = string
  description = "Region for the state bucket. Environments must use the same value in backend.hcl."
  default     = "eu-west-1"
}

variable "project" {
  type        = string
  description = "Short project name, used as the bucket name prefix"
  default     = "platform-eks"
}

variable "noncurrent_version_retention_days" {
  type        = number
  description = "How long old state versions are kept before deletion"
  default     = 30
}
