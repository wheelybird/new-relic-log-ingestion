locals {
  aws_account_id = data.aws_caller_identity.current.account_id
  aws_partition  = data.aws_partition.current.partition
  aws_region     = data.aws_region.current.name
  build_dir      = "/tmp/build_dir"
  tags = merge(
    var.tags,
    { "lambda:createdBy" = "Terraform" }
  )
}
