#!/bin/bash -e
# Will generate certificates for EC2 machine for which tag Name=${InstanceName} using their public IP, private IP and private dns name.
InstanceName=$1
CertificatesFolder=$2

script_dir=$(dirname $0)

aws_result=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=${InstanceName}" "Name=instance-state-name,Values=running" --query="Reservations[*].Instances[*].{a:PublicIpAddress,b:PrivateIpAddress,c:PrivateDnsName}" --output text)

echo "$aws_result"
public_ips="Generated certificates for hosts :"

while read -r line
do
		IFS=$'\t' read -r -a array <<< "$line"
		public_ip="${array[0]}"
		private_ip="${array[1]}"
		private_dns="${array[2]}"
		eval "${script_dir}/ssl-aws.sh ${public_ip} ${private_dns},server.dc1.yorc ${public_ip},${private_ip} ${CertificatesFolder}"
		public_ips="${public_ips} ${public_ip}"
done < <(printf '%s\n' "$aws_result")
echo "${public_ips}"
