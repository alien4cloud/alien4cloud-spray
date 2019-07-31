These playbooks install full A4C stack components (consul, york, a4c) in the home directory of the specified user.

> [!WARNING]
> These playbook's roles are not always reentrant.

# Prerequistes

You need a linux box with centos (tried on a EC2 ami-3548444c t2.medium)

You need the following vars:
 - `REMOTE_IP_ADDRESS`: ie. 34.245.10.8
 - `REMOTE_USER`: ie. centos
 - `PRIVATE_KEY_PATH`: ie. ~/work/env/aws/keys/vicos-awsproductteam.pem

You'll also need to define the variable _a4c_ip_ in `input.json` using the remote IP address.

# Setup

Rename `inputs.json.tpl` to `inputs.json` and setup few things (a minima 'a4c_ip').

If you want to activate SSL for A4C (HTTPS) you need to set 'a4c_protocol' to 'https' and to generate a keystore

The script resources/ssl.sh will generate all autosigned stuff for you

```
./resources/ssl.sh $REMOTE_IP_ADDRESS changeIt!
```

**If it prompt for a password, it needs the root password of your own machine !**

It will finally echo you something like :

> Generated key store in : /var/folders/2d/3krvvvn538ggxjx8mtvwmj_c0000gn/T/tmp.vaCqIRYH/server-keystore.p12

Fill the 'ssl_keystore_source_location' in `inputs.json` file using this path

# Installation
The playbook `install-a4c-consul-yorc.yml` will install all stack on the remote machine:

```
ansible-playbook -i $REMOTE_IP_ADDRESS, install-a4c-consul-yorc.yml --private-key $PRIVATE_KEY_PATH --user $REMOTE_USER --extra-vars "@inputs.json" -v
```

# Installation in _offline_ mode
This mode is provided in case the remote machine does not have access to Internet (but the machine running the installation must still have access to Internet).

On the local machine, first run the following commands to get all required binaries (the commands use `wget`):
```
./getBinaries.sh
./getPython.sh
./getJava.sh
```
then proceed as for a standard installation, using `inputs.json.offline.tpl` instead of `inputs.json.tpl` (or just ensure the `offline` variable is defined).

# Configure
Il you need some additional CSARs library, place the zip files in the `resources/csars` folder. If your dependencies need a specific order, prefix your file names so that the names represent such order.

This playbook will configure the orchestrator, a location, and services on the A4C instance :

```
ansible-playbook -i $REMOTE_IP_ADDRESS, setup-a4c-artemis.yml --private-key $PRIVATE_KEY_PATH --user $REMOTE_USER --extra-vars "@inputs.json" -v
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
