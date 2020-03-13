#!/bin/bash

find resources/bin/ ! -name 'readme.txt' -type f -exec rm -f {} +

# $1 folder
# $2 url
# $3 filename
# $4 curl options
download () {
  IFS='/' read -ra ADDR <<< "$2"
  resourceFileName="${ADDR[@]: -1}"
  dl_cmd="curl -# -f"
  if [ ! -z "$3" ]; then
    resourceFileName="$3"
  fi
  if [ ! -z "$4" ]; then
    dl_cmd="$dl_cmd -f $4"
  fi
  dir=$(pwd)
  # it's important for Java dl to go into the directory !
  cd $1
  dl_cmd="$dl_cmd -o $resourceFileName $2"
  echo "Downloading $resourceFileName into $1 using: $dl_cmd"
  eval "$dl_cmd"
  result="$?"
  if [ "$result" == "0" ]; then
    echo "Sucessfully downloaded $resourceFileName"
    cd $dir
  else
    echo "  _  ______    _ ";
    echo " | |/ / __ \  | |";
    echo " | ' / |  | | | |";
    echo " |  <| |  | | | |";
    echo " | . \ |__| | |_|";
    echo " |_|\_\____/  (_)";
    echo "                 ";
    echo "Fail downloading $resourceFileName"
    echo "                 ";
    cd $dir
    exit 1
  fi
}

download resources/bin/terraform-plugins https://releases.hashicorp.com/terraform-provider-null/1.0.0/terraform-provider-null_1.0.0_linux_amd64.zip
exit 0

#
# Get Java
download resources/bin/java http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz jdk-8u131-linux-x64.tar.gz "-H \"Cookie: oraclelicense=a\" -kLO"

# Get a4c ecosystem binaries
download resources/bin http://34.242.40.25/dist/alien4cloud/alien4cloud-artemis-dist/3.0.0-SNAPSHOT/alien4cloud-artemis-dist-3.0.0-SNAPSHOT-dist.tar.gz
download resources/bin https://releases.hashicorp.com/consul/1.2.3/consul_1.2.3_linux_amd64.zip
download resources/bin https://releases.hashicorp.com/consul-template/0.23.0/consul-template_0.23.0_linux_amd64.zip
download resources/bin https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
download resources/bin https://bintray.com/ystia/yorc-engine/download_file?file_path=4.0.0-M9%2Fyorc-4.0.0-M9.tgz yorc-4.0.0-M9.tgz "-L"
download resources/bin/elasticsearch https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.6.2.rpm
download resources/bin https://archive.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz
# Get rpm dependencies
#download resources/bin/rpms/ http://downloads.naulinux.ru/pub/SLCE/7x/x86_64/CyrEd/RPMS//unzip-6.0-15.1.el7.x86_64.rpm
download resources/bin/unzip http://mirror.centos.org/centos/7/os/x86_64/Packages/unzip-6.0-20.el7.x86_64.rpm
download resources/bin/rpms https://dl.fedoraproject.org/pub/epel/7/x86_64/Packages/j/jq-1.6-1.el7.x86_64.rpm
download resources/bin/rpms https://rpmfind.net/linux/mageia/distrib/6/x86_64/media/core/release/lib64onig2-5.9.6-2.mga6.x86_64.rpm

# Get Terraform plugins
download resources/bin/terraform-plugins https://releases.hashicorp.com/terraform-provider-consul/2.1.0/terraform-provider-consul_2.1.0_linux_amd64.zip
download resources/bin/terraform-plugins https://releases.hashicorp.com/terraform-provider-google/1.18.0/terraform-provider-google_1.18.0_linux_amd64.zip
download resources/bin/terraform-plugins https://releases.hashicorp.com/terraform-provider-openstack/1.9.0/terraform-provider-openstack_1.9.0_linux_amd64.zip
download resources/bin/terraform-plugins https://releases.hashicorp.com/terraform-provider-aws/1.36.0/terraform-provider-aws_1.36.0_linux_amd64.zip
download resources/bin/terraform-plugins https://releases.hashicorp.com/terraform-provider-null/1.0.0/terraform-provider-null_1.0.0_linux_amd64.zip

# Get kubectl
download resources/bin/usr https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl

# Get python Packages
download resources/bin/python https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.7.2-1.el7.ans.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/extras/x86_64/Packages/sshpass-1.06-2.el7.x86_64.rpm
download resources/bin/python http://mirror.centos.org/centos/7/extras/x86_64/Packages/python2-jmespath-0.9.0-3.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-passlib-1.6.5-2.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/os/x86_64/Packages/python2-cryptography-1.7.2-2.el7.x86_64.rpm
#download resources/bin/python http://mirror.centos.org/centos/7/updates/x86_64/Packages/python-paramiko-2.1.1-9.el7.noarch.rpm
download resources/bin/python http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/python-paramiko-2.1.1-9.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-httplib2-0.9.2-1.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/os/x86_64/Packages/scl-utils-20130529-19.el7.x86_64.rpm
download resources/bin/python http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-runtime-1.1-26.1.el7.x86_64.rpm
download resources/bin/python http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-setuptools-0.9.8-7.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-pip-8.1.2-3.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-libs-2.7.16-4.el7.x86_64.rpm
download resources/bin/python http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-2.7.16-4.el7.x86_64.rpm
download resources/bin/python http://mirror.centos.org/centos/7/os/x86_64/Packages/python-cffi-1.6.0-5.el7.x86_64.rpm
download resources/bin/python http://mirror.centos.org/centos/7/os/x86_64/Packages/python-enum34-1.0.4-1.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/os/x86_64/Packages/python-idna-2.4-1.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/os/x86_64/Packages/python-ply-3.4-11.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/os/x86_64/Packages/python-pycparser-2.14-1.el7.noarch.rpm
download resources/bin/python http://mirror.centos.org/centos/7/os/x86_64/Packages/python2-pyasn1-0.1.9-7.el7.noarch.rpm

# nginx
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/dejavu-fonts-common-2.33-6.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/dejavu-sans-fonts-2.33-6.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/fontconfig-2.13.0-4.3.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/fontpackages-filesystem-1.44-8.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/freetype-2.8-14.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/gd-2.0.35-26.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/gperftools-libs-2.6.1-1.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libjpeg-turbo-1.2.90-8.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libpng-1.5.13-7.el7_2.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libX11-1.6.7-2.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libX11-common-1.6.7-2.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libXau-1.0.8-2.1.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libxcb-1.13-1.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libXpm-3.5.12-1.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/libxslt-1.1.28-5.el7.x86_64.rpm
download resources/bin/nginx http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-1.16.1-1.el7.x86_64.rpm
download resources/bin/nginx http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-all-modules-1.16.1-1.el7.noarch.rpm
download resources/bin/nginx http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-http-image-filter-1.16.1-1.el7.x86_64.rpm
download resources/bin/nginx http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-http-perl-1.16.1-1.el7.x86_64.rpm
download resources/bin/nginx http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-http-xslt-filter-1.16.1-1.el7.x86_64.rpm
download resources/bin/nginx http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-mail-1.16.1-1.el7.x86_64.rpm
download resources/bin/nginx http://mirrors.coreix.net/fedora-epel/7/x86_64/Packages/n/nginx-mod-stream-1.16.1-1.el7.x86_64.rpm
download resources/bin/nginx http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/n/nginx-filesystem-1.16.1-1.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/centos-indexhtml-7-9.el7.centos.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/centos-logos-70.0.6-3.el7.centos.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-5.16.3-294.el7_6.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Carp-1.26-244.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-constant-1.27-2.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Encode-2.51-7.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Exporter-5.68-3.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-File-Path-2.09-2.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-File-Temp-0.23.01-3.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Filter-1.49-3.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Getopt-Long-2.40-3.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-HTTP-Tiny-0.033-3.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-libs-5.16.3-294.el7_6.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-macros-5.16.3-294.el7_6.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-parent-0.225-244.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-PathTools-3.40-5.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Pod-Escapes-1.04-294.el7_6.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-podlators-2.5.1-3.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Pod-Perldoc-3.20-4.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Pod-Simple-3.28-4.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Pod-Usage-1.63-3.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Scalar-List-Utils-1.27-248.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Socket-2.010-4.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Storable-2.45-3.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Text-ParseWords-3.29-4.el7.noarch.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-threads-1.87-4.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-threads-shared-1.43-6.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Time-HiRes-1.9725-3.el7.x86_64.rpm
download resources/bin/nginx http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/perl-Time-Local-1.2300-2.el7.noarch.rpm

echo "All resources downloaded successfully !" && \
echo "   ____  _      _ " && \
echo "  / __ \| |    | |" && \
echo " | |  | | | __ | |" && \
echo " | |  | | |/ / | |" && \
echo " | |__| |   <  |_|" && \
echo "  \____/|_|\_\ (_)" && \
echo "                  " && \
echo "                  "
echo "You can process spray install using: ansible-playbook -i hosts --private-key \$PRIVATE_KEY_PATH --user \$REMOTE_USER --extra-vars \"@inputs.yml\" -v install-a4c-consul-yorc.yml"
