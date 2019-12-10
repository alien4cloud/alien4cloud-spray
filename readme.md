These playbooks install full A4C stack components (consul, york, a4c) in the home directory of the specified user.
It supports cluster mode for Elasticsearch and Consul. Comming soon: cluster mode for A4C (HA) and Yorc.

> [!WARNING]
> The install playbook's roles are reentrant. Config playbooks are not.

# Prerequistes

You need some linux boxes with centos (tried on a EC2 ami-3548444c t2.medium)

You need the following vars:
 - `REMOTE_USER`: ie. centos
 - `PRIVATE_KEY_PATH`: ie. ~/work/env/aws/keys/vicos-awsproductteam.pem

You'll also need to define the variable _a4c_ip_ in `input.yml` using the remote IP address.

# Setup

Rename `inputs.yml.tpl` to `inputs.yml` and setup few things (a minima 'a4c_ip').

If you want to activate SSL for A4C (HTTPS) you need to set 'a4c_protocol' to 'https'.

## Inventory

You need a ansible inventory file (`hosts`) containing hostnames or ip addresses for the different nodes of your cluster, following this group name convention :

* *consul*: list of consul cluster hosts
* *elasticsearch*: list of Elasticsearch cluster hosts
* *yorc*: list of Yorc cluster hosts
* *a4c*: list of A4C cluster hosts
* *a4c_front*: a front for a4c (HA)
* *yorc_front*: a front for yorc (HA)

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

[a4c_front]
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

[a4c_front]
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

[a4c_front]
192.168.0.1

[yorc_front]
192.168.0.1
```

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

# Installation
The playbook `install-a4c-consul-yorc.yml` will install all stack on the remote machine:

Fisrt off all, if you didn't attempt to connect to the remote machines, you will probably need to desactivate the host key checking:

```
export ANSIBLE_HOST_KEY_CHECKING=False
```

Then, lauch the playbook:

```
ansible-playbook -i hosts install-a4c-consul-yorc.yml --private-key $PRIVATE_KEY_PATH --user $REMOTE_USER --extra-vars "@inputs.yml" -v
```

If you don't use a SSH key but a password authentication (which is not recomanded !) you can use:

```
ansible-playbook -i hosts install-a4c-consul-yorc.yml --user $REMOTE_USER --extra-vars "@inputs.yml" -v --extra-vars "ansible_user=root ansible_password=yourpassword"
```

# Installation in _offline_ mode
This mode is provided in case the remote machine does not have access to Internet (but the machine running the installation must still have access to Internet).

On the local machine, first run the following commands to get all required binaries (the commands use `wget`):
```
./download-offline-dependencies.sh
```
then proceed as for a standard installation, using `inputs.json.offline.tpl` instead of `inputs.json.tpl` (or just ensure the `offline` variable is defined).

# Configure
Il you need some additional CSARs library, place the zip files in the `resources/csars` folder. If your dependencies need a specific order, prefix your file names so that the names represent such order.

This playbook will configure the orchestrator, a location, and services on the A4C instance :

```
ansible-playbook -i hosts setup-a4c-artemis.yml --private-key $PRIVATE_KEY_PATH --user $REMOTE_USER --extra-vars "@inputs.yml" -v
```

That's all folk, the full system should be available.

# Tests

To test the integration between A4C and Yorc:
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
