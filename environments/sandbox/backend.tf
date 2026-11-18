terraform {
  # Partial config: bucket and region come from backend.hcl
  # (output of the bootstrap stack):
  #   terraform init -backend-config=backend.hcl
  # use_lockfile = native S3 locking (Terraform >= 1.10), no DynamoDB needed.
  backend "s3" {
    key          = "eks/sandbox/terraform.tfstate"
    encrypt      = true
    use_lockfile = true
  }
}
