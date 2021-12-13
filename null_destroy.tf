resource "null_resource" "destroy" {
depends_on = [
  aws_sagemaker_domain.mydomain
]
triggers = {
       always_run = timestamp()
}
provisioner "local-exec" {
    on_failure  = continue
    when    = destroy
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        ./cleanup.sh
    EOT
}
}