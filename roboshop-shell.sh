AMI=ami-095165dc733487595
SG=sg-0e60afdae6e80a348
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq")

for i in "${INSTANCES[@]}"; do
    if [[ "$i" == "mongodb" || "$i" == "mysql" || "$i" == "shipping" ]]; then
        INSTANCE_TYPE=t2.medium
    else
        INSTANCE_TYPE=t2.micro
    fi
    echo "Instance: $i uses $INSTANCE_TYPE"
done

# aws ec2 run-instances \
# --image-id $AMI \
# --instance-type $INSTANCE_TYPE \
# --security-group-ids $SG \
# --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]"

aws ec2 run-instances --image-id $AMI \
--instance-type $INSTANCE_TYPE \
--security-group-ids $SG \
--tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" \
--query 'Instances[0].PrivateIpAddress' --output text