#!/bin/bash

domid=$(aws sagemaker list-domains --query Domains[0].DomainId | jq -r .)

if [[ "$domid" != "null" ]];then
    echo "cleanup $domid"
    set +e
    fsid=$(aws sagemaker describe-domain --domain-id $domid --query HomeEfsFileSystemId | jq -r .)
    vpcid=$(aws sagemaker describe-domain --domain-id $domid --query VpcId | jq -r .)
    fsmt=$(aws efs describe-mount-targets --file-system-id $fsid --query MountTargets[0].MountTargetId | jq . -r) 
    sgin=$(aws ec2 describe-security-groups --filters Name=vpc-id,Values=$vpcid Name=group-name,Values=security-group-for-inbound-nfs-$domid --query SecurityGroups[0].GroupId | jq -r )
    sgout=$(aws ec2 describe-security-groups --filters Name=vpc-id,Values=$vpcid Name=group-name,Values=security-group-for-outbound-nfs-$domid --query SecurityGroups[0].GroupId | jq -r )

    if [[ "$fsmt" != "" ]];then
        echo "cleanup $fsmt"
        aws efs delete-mount-target --mount-target-id $fsmt
        sleep 5
    fi
    echo "cleanup $fsid"
    aws efs delete-file-system --file-system-id $fsid 2> /dev/null
    echo "cleanup $sgin rules "
    sgrid=$(aws ec2 describe-security-group-rules --filters Name=group-id,Values=$sgin --query SecurityGroupRules[0].SecurityGroupRuleId | jq -r )
    if [[ "$sgrid" != "null" ]];then
        aws ec2 revoke-security-group-ingress --group-id $sgin --security-group-rule-ids $sgrid
    fi
    
    echo "cleanup $sgout rules"
    sgrid=$(aws ec2 describe-security-group-rules --filters Name=group-id,Values=$sgout --query SecurityGroupRules[0].SecurityGroupRuleId | jq -r )
    if [[ "$sgrid" != "null" ]];then
        aws ec2 revoke-security-group-egress --group-id $sgout --security-group-rule-ids $sgrid
    fi 
    sleep 5
    
    # dependant object
    aws ec2 delete-security-group --group-id $sgin
    sleep 10
 # dependant object
    aws ec2 delete-security-group --group-id $sgout 2> /dev/null
    while [[ $? -ne 0 ]]; do
        sleep 15
        aws ec2 delete-security-group --group-id $sgout 2> /dev/null
    done
fi
set -e