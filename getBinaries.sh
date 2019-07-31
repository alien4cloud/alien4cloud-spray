#!/bin/bash

find resources/bin/ ! -name 'readme.txt' -type f -exec rm -f {} +
wget -P resources/bin/ http://54.246.249.105/dist/alien4cloud/alien4cloud-artemis-dist/2.2.0-SM8/alien4cloud-artemis-dist-2.2.0-SM8-dist.tar.gz
wget -P resources/bin/ https://releases.hashicorp.com/consul/1.2.3/consul_1.2.3_linux_amd64.zip
wget -P resources/bin/ https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
wget -P resources/bin/ https://github.com/ystia/yorc/releases/download/v3.2.3/yorc-3.2.3.tgz

find resources/bin/rpms/ ! -name 'readme.txt' -type f -exec rm -f {} +
wget -P resources/bin/rpms/ http://downloads.naulinux.ru/pub/SLCE/7x/x86_64/CyrEd/RPMS//unzip-6.0-15.1.el7.x86_64.rpm
wget -P resources/bin/rpms/ http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/j/jq-1.5-1.el7.x86_64.rpm

find resources/bin/terraform-plugins/ ! -name 'readme.txt' -type f -exec rm -f {} +
wget -P resources/bin/terraform-plugins/ https://releases.hashicorp.com/terraform-provider-consul/2.1.0/terraform-provider-consul_2.1.0_linux_amd64.zip
wget -P resources/bin/terraform-plugins/ https://releases.hashicorp.com/terraform-provider-google/1.18.0/terraform-provider-google_1.18.0_linux_amd64.zip
wget -P resources/bin/terraform-plugins/ https://releases.hashicorp.com/terraform-provider-openstack/1.9.0/terraform-provider-openstack_1.9.0_linux_amd64.zip
wget -P resources/bin/terraform-plugins/ https://releases.hashicorp.com/terraform-provider-aws/1.36.0/terraform-provider-aws_1.36.0_linux_amd64.zip

find resources/bin/usr/ ! -name 'readme.txt' -type f -exec rm -f {} +
wget -P resources/bin/usr/ https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl
