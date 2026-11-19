provider "aws" {
  region = var.region
  profile = "log-account"

  default_tags {
    tags = {
      Project     = "platform-eks-poc"
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}
