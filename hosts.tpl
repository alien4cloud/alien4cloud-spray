[consul]
192.168.0.10
192.168.0.11
192.168.0.12

[yorc]
192.168.0.20

[elasticsearch]
192.168.0.10
192.168.0.11
192.168.0.12

[a4c]
192.168.0.30

[a4cfront]
192.168.0.30

[samba]

[yorcfront]

[jmeter]

[a4cconfig]
# This group is used to play A4C config playbooks (roles in roles/a4c/config)
# We need to have here a single node, it can be any node in the cluster
# The target A4C url will be defined regarding cluster configuration
192.168.0.30

#localhost ansible_connection=local
