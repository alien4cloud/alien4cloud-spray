#!/bin/bash
find resources/bin/python/ ! -name 'readme.txt' -type f -exec rm -f {} +
wget -P resources/bin/python/ https://releases.ansible.com/ansible/rpm/release/epel-7-x86_64/ansible-2.7.2-1.el7.ans.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/extras/x86_64/Packages/sshpass-1.06-2.el7.x86_64.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/extras/x86_64/Packages/python2-jmespath-0.9.0-3.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-passlib-1.6.5-2.el7.noarch.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/os/x86_64/Packages/python2-cryptography-1.7.2-2.el7.x86_64.rpm
wget -P resources/bin/python/ http://mirror.centos.org/centos/7/updates/x86_64/Packages/python-paramiko-2.1.1-9.el7.noarch.rpm
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
