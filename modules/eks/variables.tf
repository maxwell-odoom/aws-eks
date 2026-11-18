variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type        = string
  description = "EKS Kubernetes version. Check `aws eks describe-cluster-versions` for supported versions."
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type        = list(string)
  description = "Private subnets (at least 2 AZs) for nodes and the control plane"
}

variable "endpoint_public_access" {
  type        = bool
  description = "Expose the API endpoint publicly (handy for kubectl from a laptop)"
  default     = true
}

variable "endpoint_public_access_cidrs" {
  type        = list(string)
  description = "CIDRs allowed to reach the public endpoint. Narrow this beyond a PoC."
  default     = ["0.0.0.0/0"]
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t3.medium"]
}

variable "node_min_size" {
  type    = number
  default = 1
}

variable "node_max_size" {
  type    = number
  default = 2
}

variable "node_desired_size" {
  type    = number
  default = 1
}
