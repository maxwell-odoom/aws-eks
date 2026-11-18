output "state_bucket_name" {
  value = aws_s3_bucket.state.bucket
}

output "state_bucket_region" {
  value = var.region
}

output "backend_hcl" {
  description = "Paste into environments/<env>/backend.hcl"
  value       = <<-EOT
    bucket = "${aws_s3_bucket.state.bucket}"
    region = "${var.region}"
  EOT
}
