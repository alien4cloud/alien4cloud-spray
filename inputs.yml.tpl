# Define if the installation should be done in offline mode (no access to internet from the hosts)
offline: false
# optionnal domain to add to host names in private communications
#private_domain_name: alien4cloud.priv
# optionnal interface name to detect relevant private ip_address
#private_interface_name: priv

# A4C
a4c_user: a4c
# optionnally specify the uid for the a4c user (we have to use a fixed one for NFS mount)
#a4c_uid: 1010
a4c_install_dir: /opt/a4c
# This is the work folder for a4c, should be a mount point (shared volume) in case of HA
#a4c_working_dir: /mnt/a4c/runtime
#a4c_log_dir: /var/log/a4c
a4c_tls: false
a4c_port: 8088
a4c_front_protocol: http
# WARNING : use 80 for http and 443 for SSL
# We have issues running correctly A4C behind a proxy
a4c_front_port: 80
a4c_admin_usr: admin
a4c_admin_pwd: 4dm1n
a4c_version: 3.0.0-M2
inventory_dir: "."

consul_user: consul
consul_install_dir: /opt/consul
# If true the Gossip protocol will we encrypted
consul_gossip_encrypt: false
# If Gossip is encrypted, the path where the key will be found
# The key is generated on a consul node in the role roles/consul/configure-consul-gossip-keygen
# It's copied in this local folder and used on all nodes
consul_gossip_encrypt_key_path: certificates/consul_encrypt_key
# If true, consul http channels will be secured using TLS (certificates nedded)
consul_tls: false
# You can force this value per group:
# For example: "a4cfront_consul_tls: true" will force consul TLS for a4cfront host

yorc_user: yorc
# optionnally specify the uid for the yorc user (we have to use a fixed one for NFS mount)
#yorc_uid: 1011
yorc_install_dir: /opt/yorc
# This is the work folder for yorc, should be a mount point (shared volume) in case of HA
#yorc_working_dir: /mnt/yorc/work
# If true yorc http server will be secured using TLS (certificates nedded)
yorc_tls: false
discriminator: ART_YORK_
# Inidicates of TLS should be activated for ES cluster
elasticsearch_tls: false
# ES data directory if not default
# elasticsearch_home: /var/lib/elasticsearch

# SSL TLS
# The local path where certificates can be found for SSL configs on nodes
certificates_path: certificates/
ca_passphrase: dontChangeIt
ssl_keystore_source_location: /var/folders/2d/3krvvvn538ggxjx8mtvwmj_c0000gn/T/tmp.vaCqIRYH/server-keystore.p12
ssl_src_keystore_password: changeit
ssl_dest_keystore_password: changeit
ssl_key_password: changeit
#ssl_ca_cert_name: "artemis_ca.pem.txt"
#ssl_host_key_suffix: ".technique.artemis.crt.txt"
#ssl_host_cert_suffix: ".technique.artemis.pem.txt"

# Download urls in online mode
elasticsearch_rmp_url:- http://10.10.0.49/elasticsearch-6.6.2.rpm
ALIEN_DIST_URL: http://34.242.40.25/dist/alien4cloud/alien4cloud-artemis-dist/3.0.0-M2/alien4cloud-artemis-dist-3.0.0-M2-dist.tar.gz
JAVA_DIST_URL: http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
CONSUL_DIST_URL: https://releases.hashicorp.com/consul/1.2.3/consul_1.2.3_linux_amd64.zip
YORC_DIST_URL: https://bintray.com/ystia/yorc-engine/download_file?file_path=4.0.0-M6%2Fyorc-4.0.0-M6.tgz
TERRAFORM_DIST_URL: https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
CONSUL_TEMPLATE_DL_URL: https://releases.hashicorp.com/consul-template/0.23.0/consul-template_0.23.0_linux_amd64.zip
terraform_plugins:
  - https://releases.hashicorp.com/terraform-provider-consul/2.1.0/terraform-provider-consul_2.1.0_linux_amd64.zip
  - https://releases.hashicorp.com/terraform-provider-google/1.18.0/terraform-provider-google_1.18.0_linux_amd64.zip
  - https://releases.hashicorp.com/terraform-provider-openstack/1.9.0/terraform-provider-openstack_1.9.0_linux_amd64.zip
  - https://releases.hashicorp.com/terraform-provider-aws/1.36.0/terraform-provider-aws_1.36.0_linux_amd64.zip
yorc_dependencies_rpm_urls:
  - http://download-ib01.fedoraproject.org/pub/epel/7/x86_64/Packages/j/jq-1.5-1.el7.x86_64.rpm
#  - https://rpmfind.net/linux/mageia/distrib/6/x86_64/media/core/release/lib64onig2-5.9.6-2.mga6.x86_64.rpm
  - http://10.10.0.49/ansible-2.7.2-1.el7.ans.noarch.rpm
  - http://mirror.centos.org/centos/7/extras/x86_64/Packages/sshpass-1.06-2.el7.x86_64.rpm
  - http://mirror.centos.org/centos/7/extras/x86_64/Packages/python2-jmespath-0.9.0-3.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-passlib-1.6.5-2.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/os/x86_64/Packages/python2-cryptography-1.7.2-2.el7.x86_64.rpm
  - http://ftp.heanet.ie/pub/centos/7.7.1908/os/x86_64/Packages/python-paramiko-2.1.1-9.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/extras/x86_64/Packages/python-httplib2-0.9.2-1.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/os/x86_64/Packages/scl-utils-20130529-19.el7.x86_64.rpm
  - http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-runtime-1.1-26.1.el7.x86_64.rpm
  - http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-setuptools-0.9.8-7.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-pip-8.1.2-3.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-libs-2.7.16-4.el7.x86_64.rpm
  - http://mirror.centos.org/centos/7/sclo/x86_64/rh/python27/python27-python-2.7.16-4.el7.x86_64.rpm
  - http://mirror.centos.org/centos/7/os/x86_64/Packages/python-cffi-1.6.0-5.el7.x86_64.rpm
  - http://mirror.centos.org/centos/7/os/x86_64/Packages/python-enum34-1.0.4-1.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/os/x86_64/Packages/python-idna-2.4-1.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/os/x86_64/Packages/python-ply-3.4-11.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/os/x86_64/Packages/python-pycparser-2.14-1.el7.noarch.rpm
  - http://mirror.centos.org/centos/7/os/x86_64/Packages/python2-pyasn1-0.1.9-7.el7.noarch.rpm
yorc_dependencies_usr_urls:
  - https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl

# For Yorc AWS configuration
AWS_ACCESS_KEY:
AWS_SECRET_KEY:
AWS_REGION: eu-west-1

dev_projects_path: /Users/xdegenne/work/src
# These CSARs will be downloaded and uploaded to A4C
csar_urls:
  - http://somewhere/csar1.zip
  - http://somewhere/csar2.zip


dont_install_epel: true
