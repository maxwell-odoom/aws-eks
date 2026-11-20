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

variable "availability_zone" {
  type        = string
  description = "AZ for both subnets. Defaults to the first available AZ in the region."
  default     = null
}
