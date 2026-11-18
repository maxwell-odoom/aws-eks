variable "name" {
  type        = string
  description = "Name prefix for VPC resources"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name, used for subnet discovery tags"
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "az_count" {
  type        = number
  description = "Number of availability zones (EKS needs at least 2)"
  default     = 2

  validation {
    condition     = var.az_count >= 2
    error_message = "EKS requires subnets in at least 2 availability zones."
  }
}

variable "single_nat_gateway" {
  type        = bool
  description = "One shared NAT gateway (cheap) instead of one per AZ (highly available)"
  default     = true
}
