variable "region" {
  type        = string
  description = "AWS region of the sandbox"
  default     = "eu-west-1"
}

variable "environment" {
  type    = string
  default = "sandbox"
}

variable "cluster_name" {
  type    = string
  default = "platform-poc"
}

variable "kubernetes_version" {
  type        = string
  description = "Check `aws eks describe-cluster-versions` for versions in standard support before applying"
  default     = "1.31"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "endpoint_public_access_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to reach the cluster API. Set to your office/VPN IP."
  default     = ["0.0.0.0/0"]
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}
