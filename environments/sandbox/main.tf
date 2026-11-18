module "vpc" {
  source = "../../modules/vpc"

  name         = "${var.cluster_name}-${var.environment}"
  cluster_name = var.cluster_name
  cidr         = var.vpc_cidr
}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids

  endpoint_public_access_cidrs = var.endpoint_public_access_cidrs
  node_instance_types          = var.node_instance_types
}
