# platform-unit / aws-eks

Terraform for an EKS cluster on AWS. Everything (state bucket, VPC, cluster) is provisioned with Terraform.

## Layout

```
.
├── bootstrap/              # One-time: S3 bucket for remote state (local state)
├── modules/
│   ├── vpc/                # VPC, public/private subnets, NAT, EKS subnet tags
│   └── eks/                # EKS control plane, add-ons, managed node group
└── environments/
    └── sandbox/            # Root module: wires modules together, S3 backend
```

To add an environment (e.g. `staging`), copy `environments/sandbox/`, change the
backend `key` in `backend.tf`, and adjust `terraform.tfvars`.

## Prerequisites

- Terraform >= 1.10 (native S3 state locking)
- AWS CLI with credentials for the target account

## 1. Bootstrap the state bucket (once per account/region)

```sh
cd bootstrap
terraform init
terraform apply
terraform output -raw backend_hcl > ../environments/sandbox/backend.hcl
```

The bucket name is `<project>-tfstate-<account-id>-<region>`, with versioning, encryption,
public access blocked and TLS-only access. It has `prevent_destroy` set.

`bootstrap/terraform.tfstate` is **local** and gitignored. Whoever runs bootstrap should keep it
(or import the bucket later with `terraform import aws_s3_bucket.state <bucket>`).

## 2. Deploy an environment

```sh
cd environments/sandbox
cp terraform.tfvars.example terraform.tfvars   # edit values
terraform init -backend-config=backend.hcl
terraform plan
terraform apply
```

Then configure kubectl with the command from `terraform output kubeconfig_command`.

## Notes

- Check the Kubernetes versions in standard support before applying:
  `aws eks describe-cluster-versions --query "clusterVersions[].[clusterVersion,status]"`.
  Versions in extended support cost more.
- `single_nat_gateway = true` keeps sandbox cost down. Set it to `false` for per-AZ NAT in production.
- Narrow `endpoint_public_access_cidrs` to your office/VPN IP.
