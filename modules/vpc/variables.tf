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

variable "availability_zones" {
  type        = list(string)
  description = "AZs to create one public and one private subnet in. Defaults to the first two available AZs in the region."
  default     = null

  # EKS needs at least two AZs; more than three would overlap the private and public CIDR ranges.
  validation {
    condition     = var.availability_zones == null || try(length(var.availability_zones) >= 2 && length(var.availability_zones) <= 3, false)
    error_message = "availability_zones must contain 2 or 3 AZs."
  }
}
