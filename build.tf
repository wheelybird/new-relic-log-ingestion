resource "null_resource" "build_lambda" {

  depends_on = [aws_cloudwatch_log_group.lambda_logs]

  provisioner "local-exec" {

    command     = "./build.sh"
    working_dir = path.module

    environment = {
      build_dir      = local.build_dir
      python_version = var.python_runtime_version
      archive_name   = local.archive_name
    }

  }

}
