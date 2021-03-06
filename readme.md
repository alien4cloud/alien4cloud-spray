These playbooks install full A4C stack components (consul, yorc, a4c) in the home directory of the specified user.
It supports cluster mode for Elasticsearch and Consul. Comming soon: cluster mode for A4C (HA) and Yorc.

> [!WARNING]
> The install playbook's roles are reentrant. Config playbooks are not.

# Prerequisites

Ansible >= 2.8.3

You need some linux boxes with centos (tried on a EC2 ami-3548444c t2.medium)

You need the following vars:
 - `REMOTE_USER`: ie. centos
 - `PRIVATE_KEY_PATH`: ie. ~/work/env/aws/keys/vicos-awsproductteam.pem

# Setup

Rename `inputs.yml.tpl` to `inputs.yml` and setup few things.

If you want to activate SSL for A4C (HTTPS) you need to set 'a4c_protocol' to 'https'.

## Inventory

You need a ansible inventory file (`hosts`) containing hostnames or ip addresses for the different nodes of your cluster, following this group name convention :

* *consul*: list of consul cluster hosts (at least 1)
* *elasticsearch*: list of Elasticsearch cluster hosts (0,1 or many)
* *yorc*: list of Yorc cluster hosts (at least 1)
* *a4c*: list of A4C cluster hosts (at least 1)
* *a4cfront*: a front for a4c (HA) (0 or 1)
* *yorcfront*: a front for yorc (HA) (0 or 1)

Please not that if no *elasticsearch* group is provided, the A4C will started using an embeded ES node (not suitable for production).

You can adapt the file regarding the configuration you need:

Here is an example where Elasticsearch and Consul are co-hosted on a 3 nodes cluster, 1 host for A4C, and 1 other host for Yorc:

```
[consul]
192.168.0.10
192.168.0.11
192.168.0.12

[yorc]
192.168.0.2

[elasticsearch]
192.168.0.10
192.168.0.11
192.168.0.12

[a4c]
192.168.0.1

[a4cfront]
192.168.0.1
```

In the example below, we only setup a single host containing all stack:

```
[consul]
192.168.0.1

[yorc]
192.168.0.1

[elasticsearch]
192.168.0.1

[a4c]
192.168.0.1

[a4cfront]
192.168.0.1
```

In the example below, a 2 nodes cluster for consul and elasticsearch, 2 nodes having both a4c and yorc in HA, and a front for both a4c and yorc (nginx):

```
[consul]
192.168.0.10
192.168.0.11

[yorc]
192.168.0.12
192.168.0.13

[elasticsearch]
192.168.0.10
192.168.0.11

[a4c]
192.168.0.12
192.168.0.13

[a4cfront]
192.168.0.1

[yorcfront]
192.168.0.1
```

# HA

HA is enable be having multiple hosts in a4c and/or yorc group:
* To enable HA for A4C, you just need to have more than one host in `a4c` host group and one host in the `a4cfront` host group. A4C need that the folder defined by `a4c_working_dir` var is shared between every a4c hosts (NFS or other distributed FS).
* To enable HA for Yorc, put more than one host in `yorc` host group. Yorc needs that the folder defined `yorc_working_dir` var is shared between every Yorc hosts (NFS or other distributed FS).

You can use the playbook `install-samba.yml` in order to setup a Samba server (on the `samba` host). It will mount respectively `a4c_working_dir` and `yorc_working_dir` folders on `a4c` and `yorc` hosts. This playvbook is here as an example but should not be used in a production environment.

We also have a role to setup rsync based replication (to de documented).

## SSL Certificates

If you want to securize the components of your stack, you will need to have some certificates for each concerned hosts.

All certificates should be found in the `certificates_path` folder.

We need the CA certificate to feed truststores:

* `ca-cert.pem` : X509 certificate for the CA

And for each host:

* `${hostname}-key.pem` : RSA private key for the host
* `${hostname}-cert.pem` : X509 certificate for the host, signed using the CA certificate.

We use to generate certificates with SAN extension (Subject Alt Name) containing :
* IP: public IP
* IP: private IP
* IP: '127.0.0.1'
* DNS: hostname
* DNS: 'localhost'
* DNS: server.dc1.yorc (server.${datacenter}.${domain}) for the consul cluster members.

Usually, we use to add the `extendedKeyUsage` extension with values `serverAuth,clientAuth` since our components are usually both clients and servers.

You can find scripts that help you generating such CA and hosts keys and certificates:
* `resources/ssl/gen-ssl-material.sh` : generate CA key and certificate of not found and key and certificate for a given host.
* `resources/ssl/gen-aws-ssl-material.sh` : generate all SSL stuff for EC2 instances (filtered by name).

For an AWS setup, you can generate all your certificates using:
```
./resources/ssl/gen-aws-ssl-material.sh Spray-A4C ./certificates/
```
Where `Spray-A4C` is the name of the instance(s) (label name in EC2).
All the SSL stuff will be generated for all hosts having this label (I usually use the output to feed the `hosts` inventory file).

# Installation

> The following explanations will detail separate steps for installation, configuration and tests but you can use the all in one `install-all-setup-test.yml` playbook instead.

The playbook `install-all.yml` will install all stack on the remote machine(s):

First off all, if you didn't attempt to connect to the remote machines, you will probably need to deactivate the host key checking:

```
export ANSIBLE_HOST_KEY_CHECKING=False
```

Then, launch the playbook:

```
ansible-playbook -i hosts --private-key $PRIVATE_KEY_PATH --user $REMOTE_USER --extra-vars "@inputs.yml" -v playbooks/install-all.yml
```

If you don't use a SSH key but a password authentication (which is not recommended !) you can use:

```
ansible-playbook -i hosts --user $REMOTE_USER --extra-vars "@inputs.yml" -v --extra-vars "ansible_user=root ansible_password=yourpassword"  playbooks/install-all.yml
```

# Installation in _offline_ mode
This mode is provided in case the remote machine does not have access to Internet (but the machine running the installation must still have access to Internet).

On the local machine, first run the following commands to get all required binaries (the commands use `curl`):
```
./download-offline-dependencies.sh
```
then proceed as for a standard installation, using `inputs.yml.offline.tpl` instead of `inputs.yml.tpl` (or just ensure the `offline` variable is defined to `true`).

# Configure
Il you need some additional CSARs library, place the zip files in the `resources/csars` folder. If your dependencies need a specific order, prefix your file names so that the names represent such order.

This playbook will configure the orchestrator, a location, and services on the A4C instance :

```
ansible-playbook -i hosts --private-key $PRIVATE_KEY_PATH --user $REMOTE_USER --extra-vars "@inputs.yml" -v  playbooks/setup-a4c.yml
```

That's all folk, the full system should be available.

# Tests

This playbook will make a simple integration by deploying a simple mock based application, ensuring all the stack is available and all stuff well connected together.

```
ansible-playbook -i hosts --private-key $PRIVATE_KEY_PATH --user $REMOTE_USER --extra-vars "@inputs.yml" -v playbooks/test-deployment.yml
```

To test manually the integration between A4C and Yorc:
 1. Go to 'Application' / 'Nouvelle Application'
 2. Give a name to your app (ie. MyFirstTest)
 3. In 'Modèle de topologie', choose '3MockWithRel' template
 4. Click on 'Créer'
 5. In 'Work on an environment' section, click on the line 'Environment OTHER 0.1.0-SNAPSHOT'
 6. Choose the "AWS Orchestrator: Yorc" under the 'Locations' blue button
 7. Click on 'Vérifier & activer'
 8. Click on 'Activer'
 9. You will then see a progess bar ... if all is finally green, all is OK.
 10. Click on 'Désactiver'


# Upgrade

You can upgrade an existing A4C installation using the upgrade-a4c playbook.
Ensure your var `ALIEN_DIST_URL` is pointing to your new distribution.
You can also specify the list of plugins you want to be upgraded using the list `a4c_upgrade_plugins`.

```
a4c_upgrade_plugins:
  - my-plugin-1
  - my-plugin-2
```

Please not that:
* If `a4c_upgrade_plugins` is not defined, all plugins found in the new distribution will be used.
* If `a4c_upgrade_plugins` is defined but empty, no plugin will be upgraded.

```
ansible-playbook -i hosts --private-key $PRIVATE_KEY_PATH --user $REMOTE_USER --extra-vars "@inputs.yml" -v playbooks/upgrade-a4c.yml
```

During upgrade, all changes will be logged in 'changes.log' in a4c log folder.

# Development setup

The playbook [playbooks/setup-dev.yml](playbooks/setup-dev.yml) has be written to help you setup a development environment. It just setup an empty running localhost A4C (in your IDE for example), and automatize repetitive tasks in order to have a full working and configured A4C without any pain.

It needs that all plugins projects are localized in the same directory and built.

Just fill the [inputs-dev.yml](inputs-dev.yml) input file in order to fit your needs.

```
ansible-playbook --extra-vars "@inputs-dev.yml" playbooks/setup-dev.yml
```
