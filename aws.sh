#!/usr/bin/env bash

#list info about all instances in the account
for region in `aws ec2 describe-regions --output text | cut -f4`; 
do
  echo -e "\nListing Instances in region:'$region'...";
  aws ec2 describe-instances --query "Reservations[*].Instances[*].{IP:PublicIpAddress,ID:InstanceId,Type:InstanceType,State:State.Name,Name:Tags[?Key=='Name']|[0].Value}" --output=table --region $region;
done
