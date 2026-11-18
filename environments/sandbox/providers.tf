provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "platform-eks-poc"
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}
