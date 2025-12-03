#!/bin/bash

AMI="ami-095165dc733487595"
SG="sg-0e60afdae6e80a348"    # use this variable below
INSTANCES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payment" "dispatch" "web")
ZONE_ID="Z02868402LCI9EOU8D3TT"   # replace with your hosted zone ID
DOMAIN_NAME="maheshakki.shop"

for i in "${INSTANCES[@]}"; do
  # decide instance type
  if [[ "$i" == "mongodb" || "$i" == "mysql" || "$i" == "shipping" ]]; then
    INSTANCE_TYPE="t3.small"
  else
    INSTANCE_TYPE="t2.micro"
  fi

  # launch instance and capture private IP
  IP_ADDRESS=$(aws ec2 run-instances \
    --image-id "$AMI" \
    --instance-type "$INSTANCE_TYPE" \
    --security-group-ids "$SG" \
    --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" \
    --query 'Instances[0].PrivateIpAddress' \
    --output text)

  echo "$i: $IP_ADDRESS"

  # create or update Route 53 A record
  aws route53 change-resource-record-sets \
    --hosted-zone-id "$ZONE_ID" \
    --change-batch "{
      \"Comment\": \"Creating a record set for $i\",
      \"Changes\": [{
        \"Action\": \"UPSERT\",
        \"ResourceRecordSet\": {
          \"Name\": \"${i}.${DOMAIN_NAME}\",
          \"Type\": \"A\",
          \"TTL\": 60,
          \"ResourceRecords\": [{
            \"Value\": \"${IP_ADDRESS}\"
          }]
        }
      }]
    }"
done
