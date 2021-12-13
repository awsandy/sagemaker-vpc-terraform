resource "null_resource" "destroy" {

triggers = {
       always_run = timestamp()
}
provisioner "local-exec" {
    on_failure  = continue
    when    = destroy
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        fsid=$(terraform output home_efs_file_system_id | tr -d '"')
        sgin=$(terraform output sg-sm-inbound | tr -d '"')
        sgout=$(terraform output sg-sm-outbound | tr -d '"')
        echo "attempt cleanup"
        aws efs delete-file-system --file-system-id $fsid
        aws ec2 delete-security-group --group-id $sgin
        aws ec2 delete-security-group --group-id $sgout
     EOT
}
}