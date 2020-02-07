# Define if the installation should be done in offline mode (no access to internet from the hosts)
offline: true
# optionnal domain to add to host names in private communications
#private_domain_name: alien4cloud.priv
# optionnal interface name to detect relevant private ip_address
#private_interface_name: priv

# A4C
a4c_user: a4c
a4c_install_dir: /opt/a4c
# This is the work folder for a4c, should be a mount point (shared volume) in case of HA
#a4c_working_dir: /mnt/a4c/runtime
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

yorc_user: yorc
yorc_install_dir: /opt/yorc
# This is the work folder for yorc, should be a mount point (shared volume) in case of HA
#yorc_working_dir: /mnt/yorc/work
# If true yorc http server will be secured using TLS (certificates nedded)
yorc_tls: false
discriminator: ART_YORK_

# Inidicates of TLS should be activated for ES cluster
elasticsearch_tls: false

# SSL TLS
# The local path where certificates can be found for SSL configs on nodes
certificates_path: certificates/
ca_passphrase: dontChangeIt
ssl_keystore_source_location: /var/folders/2d/3krvvvn538ggxjx8mtvwmj_c0000gn/T/tmp.vaCqIRYH/server-keystore.p12
ssl_src_keystore_password: changeit
ssl_dest_keystore_password: changeit
ssl_key_password: changeit

# Download urls in online mode
elasticsearch_rmp_url: resources/bin/elasticsearch/elasticsearch-6.6.2.rpm
spark_download_url: resources/bin/spark-2.4.4-bin-hadoop2.7.tgz
ALIEN_DIST_URL: resources/bin/alien4cloud-artemis-dist-3.0.0-M2-dist.tar.gz
JAVA_DIST_URL: resources/bin/java/jdk-8u131-linux-x64.tar.gz
CONSUL_DIST_URL: resources/bin/consul_1.2.3_linux_amd64.zip
YORC_DIST_URL: resources/bin/yorc-4.0.0-M6.tgz
TERRAFORM_DIST_URL: resources/bin/terraform_0.11.8_linux_amd64.zip
CONSUL_TEMPLATE_DL_URL: resources/bin/consul-template_0.23.0_linux_amd64.zip

# For Yorc AWS configuration
AWS_ACCESS_KEY:
AWS_SECRET_KEY:
AWS_REGION: eu-west-1

dev_projects_path: /Users/xdegenne/work/src

dont_install_epel: true
