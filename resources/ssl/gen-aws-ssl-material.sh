#!/bin/bash -e
# Will generate certificates for EC2 hosts for which tag Name=${InstanceName} using their public IP, private IP and private dns name.
# This script needs aws cli to be installed and configured.

# Example usage : ./resources/ssl/gen-aws-ssl-material.sh Spray-cluster ./certificates/
# Will generate keys and certificates for all running EC2 instances named 'Spray-cluster' in the ./certificates/ folder.

# The instance name used to filter the running AWS EC2 instances (filter using the tag 'Name')
InstanceName=$1
if [ -z "$1" ]; then
  echo "Please provide an instance name as 1st parameter";
  exit 1;
fi

# The folder where to generate keys and certificates
CertificatesFolder=$2
if [ -z "$2" ]; then
  echo "Please provide a dest folder a 2nd parameter";
  exit 1;
fi
# pass --dry just to simulate
DryRun=$3

script_dir=$(dirname $0)

aws_result=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${InstanceName}" "Name=instance-state-name,Values=running" --query="Reservations[*].Instances[*].{a:PublicIpAddress,b:PrivateIpAddress,c:PrivateDnsName}" --output text)

echo "$aws_result"
public_ips="\nGenerated certificates for hosts : "

while read -r line
do
		IFS=$'\t' read -r -a array <<< "$line"
		public_ip="${array[0]}"
		private_ip="${array[1]}"
		private_dns="${array[2]}"
		if [ -z "$DryRun" ] || [ "$DryRun" != "--dry" ]; then
			eval "${script_dir}/gen-ssl-material.sh ${public_ip} ${private_dns},server.dc1.yorc,localhost ${public_ip},${private_ip} ${CertificatesFolder}"
		fi
		public_ips="${public_ips}\n${public_ip}"
done < <(printf '%s\n' "$aws_result")

printf -v str "${public_ips}\n"
echo "$str"
