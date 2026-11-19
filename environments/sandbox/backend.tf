terraform {
  # Partial config: bucket and region come from backend.hcl
  # (output of the bootstrap stack):
  #   terraform init -backend-config=backend.hcl
  # use_lockfile = native S3 locking (Terraform >= 1.10), no DynamoDB needed.
  backend "s3" {
    bucket = "platform-eks-tfstate-123456789012-eu-west-1"
    key          = "eks/sandbox/terraform.tfstate"
    profile = "log-account"
    encrypt      = true
    use_lockfile = true
  }
}
