locals {
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_partition  = data.aws_partition.current.partition
  aws_region     = data.aws_region.current.name
  archive_name   = var.lambda_archive
  build_dir      = "/tmp/build_dir"
  archive_folder = dirname(local.archive_name)
  tags = merge(
    var.tags,
    { "lambda:createdBy" = "Terraform" }
  )
}
