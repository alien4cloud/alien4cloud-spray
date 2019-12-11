#!/bin/bash

find resources/bin/ ! -name 'readme.txt' -type f -exec rm -f {} +

# Get a4c ecosystem binaries
wget -P resources/bin/ http://54.246.249.105/dist/alien4cloud/alien4cloud-artemis-dist/3.0.0-M1/alien4cloud-artemis-dist-3.0.0-M1-dist.tar.gz
wget -P resources/bin/ https://releases.hashicorp.com/consul/1.2.3/consul_1.2.3_linux_amd64.zip
wget -P resources/bin/ https://releases.hashicorp.com/consul-template/0.23.0/consul-template_0.23.0_linux_amd64.zip
wget -P resources/bin/ https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
wget -O resources/bin/yorc-4.0.0-M6.tgz https://bintray.com/ystia/yorc-engine/download_file?file_path=4.0.0-M6%2Fyorc-4.0.0-M6.tgz
wget -P resources/bin/elasticsearch/ https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.2.rpm

# Get rpm dependencies
#wget -P resources/bin/rpms/ http://downloads.naulinux.ru/pub/SLCE/7x/x86_64/CyrEd/RPMS//unzip-6.0-15.1.el7.x86_64.rpm
wget -P resources/bin/unzip/ http://mirror.centos.org/centos/7/os/x86_64/Packages/unzip-6.0-20.el7.x86_64.rpm
wget -P resources/bin/rpms/ http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/j/jq-1.5-1.el7.x86_64.rpm
wget -O resources/bin/rpms/0-libonig.rpm https://rpmfind.net/linux/mageia/distrib/6/x86_64/media/core/release/lib64onig2-5.9.6-2.mga6.x86_64.rpm

# Get Terraform plugins
wget -P resources/bin/terraform-plugins/ https://releases.hashicorp.com/terraform-provider-consul/2.1.0/terraform-provider-consul_2.1.0_linux_amd64.zip
wget -P resources/bin/terraform-plugins/ https://releases.hashicorp.com/terraform-provider-google/1.18.0/terraform-provider-google_1.18.0_linux_amd64.zip
wget -P resources/bin/terraform-plugins/ https://releases.hashicorp.com/terraform-provider-openstack/1.9.0/terraform-provider-openstack_1.9.0_linux_amd64.zip
wget -P resources/bin/terraform-plugins/ https://releases.hashicorp.com/terraform-provider-aws/1.36.0/terraform-provider-aws_1.36.0_linux_amd64.zip

# Get kubectl
wget -P resources/bin/usr/ https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl

# Get Java
wget --continue --no-check-certificate -O resources/bin/java/jdk.tar.gz --header "Cookie: oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
#wget -O resources/bin/java/jdk.tar.gz https://api.adoptopenjdk.net/v2/binary/releases/openjdk8?openjdk_impl=hotspot&os=linux&arch=x64&release=jdk8u212-b03&type=jdk

# Get python Packages
wget -P resources/bin/python/ https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.7.2-1.el7.ans.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/extras/x86_64/Packages/sshpass-1.06-2.el7.x86_64.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/extras/x86_64/Packages/python2-jmespath-0.9.0-3.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-passlib-1.6.5-2.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/python2-cryptography-1.7.2-2.el7.x86_64.rpm
#wget -P resources/bin/python/ http://mirror.centos.org/centos/7/updates/x86_64/Packages/python-paramiko-2.1.1-9.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-httplib2-0.9.2-1.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/scl-utils-20130529-19.el7.x86_64.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-runtime-1.1-26.1.el7.x86_64.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-setuptools-0.9.8-7.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-pip-8.1.2-3.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-libs-2.7.16-4.el7.x86_64.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-2.7.16-4.el7.x86_64.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/python-cffi-1.6.0-5.el7.x86_64.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/python-enum34-1.0.4-1.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/python-idna-2.4-1.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/python-ply-3.4-11.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/python-pycparser-2.14-1.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/python2-pyasn1-0.1.9-7.el7.noarch.rpm

# nginx
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/dejavu-fonts-common-2.33-6.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/dejavu-sans-fonts-2.33-6.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/fontconfig-2.13.0-4.3.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/fontpackages-filesystem-1.44-8.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/freetype-2.8-14.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/gd-2.0.35-26.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/gperftools-libs-2.6.1-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libjpeg-turbo-1.2.90-8.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libpng-1.5.13-7.el7_2.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libX11-1.6.7-2.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libX11-common-1.6.7-2.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libXau-1.0.8-2.1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libxcb-1.13-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libXpm-3.5.12-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libxslt-1.1.28-5.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-1.16.1-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-all-modules-1.16.1-1.el7.noarch.rpm
wget -P resources/bin/nginx/ http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-http-image-filter-1.16.1-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-http-perl-1.16.1-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-http-xslt-filter-1.16.1-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-mail-1.16.1-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-stream-1.16.1-1.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/n/nginx-filesystem-1.16.1-1.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/centos-indexhtml-7-9.el7.centos.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/centos-logos-70.0.6-3.el7.centos.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-5.16.3-294.el7_6.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Carp-1.26-244.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-constant-1.27-2.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Encode-2.51-7.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Exporter-5.68-3.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-File-Path-2.09-2.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-File-Temp-0.23.01-3.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Filter-1.49-3.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Getopt-Long-2.40-3.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-HTTP-Tiny-0.033-3.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-libs-5.16.3-294.el7_6.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-macros-5.16.3-294.el7_6.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-parent-0.225-244.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-PathTools-3.40-5.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Pod-Escapes-1.04-294.el7_6.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-podlators-2.5.1-3.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Pod-Perldoc-3.20-4.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Pod-Simple-3.28-4.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Pod-Usage-1.63-3.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Scalar-List-Utils-1.27-248.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Socket-2.010-4.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Storable-2.45-3.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Text-ParseWords-3.29-4.el7.noarch.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-threads-1.87-4.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-threads-shared-1.43-6.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Time-HiRes-1.9725-3.el7.x86_64.rpm
wget -P resources/bin/nginx/ http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Time-Local-1.2300-2.el7.noarch.rpm
