#!/bin/bash

find resources/bin/java/ ! -name 'readme.txt' -type f -exec rm -f {} +
wget --continue --no-check-certificate -O resources/bin/java/jdk.tar.gz --header "Cookie: oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
# wget http://mirror.centos.org/centos/7/updates/x86_64/Packages/java-1.8.0-openjdk-headless-1.8.0.222.b10-0.el7_6.x86_64.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/avahi-libs-0.6.31-19.el7.x86_64.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/copy-jdk-configs-3.3-10.el7_5.noarch.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/cups-libs-1.6.3-35.el7.x86_64.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/javapackages-tools-3.4.1-11.el7.noarch.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libjpeg-turbo-1.2.90-6.el7.x86_64.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/libxslt-1.1.28-5.el7.x86_64.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/lksctp-tools-1.0.17-2.el7.x86_64.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/pcsc-lite-libs-1.8.8-8.el7.x86_64.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/python-javapackages-3.4.1-11.el7.noarch.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/python-lxml-3.2.1-4.el7.x86_64.rpm
# wget http://mirror.centos.org/centos/7/updates/x86_64/Packages/tzdata-java-2019b-1.el7.noarch.rpm
# wget http://mirror.centos.org/centos/7/os/x86_64/Packages/nss-3.36.0-7.el7_5.x86_64.rpm
