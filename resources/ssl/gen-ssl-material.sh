#!/bin/bash -e
# ./resources/ssl/gen-ssl-material.sh 54.194.244.173 ip-172-31-10-8.eu-west-1.compute.internal,server.dc1.yorc 172.31.10.8,54.194.244.173 /Users/xdegenne/work/src/alien4cloud-artemis-spray/certificates/

# Used as a CN to name the certicificate and to name the .pem files
CN=$1
# A comma separated string containing all the domaine name that should be declared as subjectAltName DNS in certificate.
DNs=$2
# A comma separated string containing all the IPs that should be declared as subjectAltName IP in certificate.
IPs=$3
# The folder where to store the generated files
SSL_DIR=$4
# The passphrase for the CA
CA_PASSPHRASE=$5

# local template for openssl config
# MacOS
OPENSSL_CONF=/usr/local/etc/openssl/openssl.cnf
# Centos
#OPENSSL_CONF=/etc/pki/tls/openssl.cnf

if [ -z "$SSL_DIR" ]; then
	SSL_DIR=`mktemp -d`
fi
DEST_DIR=$SSL_DIR
mkdir -p "$DEST_DIR"

if [ -z "$CA_PASSPHRASE" ]; then
	CA_PASSPHRASE=dontChangeIt
fi

if [ ! -f "$SSL_DIR/ca-key.pem" ]; then
	echo "Generate CA key in $SSL_DIR/ca-key.pem"
	openssl genrsa -passout pass:$CA_PASSPHRASE -aes256 -out $SSL_DIR/ca-key.pem 4096
fi

if [ ! -f "$SSL_DIR/ca-cert.pem" ]; then
	echo "Generate CA certificate in $SSL_DIR/ca-cert.pem"
	openssl req \
		-new -x509 \
		-days 365 \
		-key $SSL_DIR/ca-key.pem \
		-sha256 \
		-out $SSL_DIR/ca-cert.pem \
		-passin pass:$CA_PASSPHRASE \
		-subj "/C=FR/ST=Denial/L=Springfield/O=Dis/CN=alien4cloud.org"
fi

# echo "Generate client key"
# Generate a key pair
echo "Generate a key pair for $CN in ${DEST_DIR}/${CN}-key.pem"
openssl genrsa -out ${DEST_DIR}/${CN}-key.pem 4096

# Sign the key with the CA and create a certificate
subjectAltName="subjectAltName = IP:127.0.0.1,DNS:localhost"
IFS=","
for IPi in $IPs
do
   subjectAltName="${subjectAltName},IP:${IPi}"
done
for DNi in $DNs
do
   subjectAltName="${subjectAltName},DNS:${DNi}"
done

echo "[ SAN ]" > $DEST_DIR/${CN}-extfile.cnf
echo "extendedKeyUsage = serverAuth,clientAuth" >> $DEST_DIR/${CN}-extfile.cnf
echo "${subjectAltName}" >> $DEST_DIR/${CN}-extfile.cnf

echo "---------------- Ext File ----------------"
cat $DEST_DIR/${CN}-extfile.cnf
echo "------------------------------------------"

if [ -f "$DEST_DIR/${CN}.csr" ]; then
  rm "$DEST_DIR/${CN}.csr"
fi
if [ -f "$DEST_DIR/${CN}-cert.pem" ]; then
  rm "$DEST_DIR/${CN}-cert.pem"
fi

echo "Generate a certificate for $CN in $DEST_DIR/${CN}.csr"
openssl req -subj "/CN=${CN}" -sha256 -new \
		-key $DEST_DIR/${CN}-key.pem \
		-out $DEST_DIR/${CN}.csr \
		-reqexts SAN -config <(cat ${OPENSSL_CONF} <(printf "[SAN]\n${subjectAltName}"))

echo "Sign the key with the CA and create a certificate for $CN in $DEST_DIR/${CN}-cert.pem"
openssl x509 -req -days 365 -sha256 \
    -in $DEST_DIR/${CN}.csr -CA $SSL_DIR/ca-cert.pem -CAkey $SSL_DIR/ca-key.pem \
    -CAcreateserial -out $DEST_DIR/${CN}-cert.pem \
    -passin pass:$CA_PASSPHRASE \
    -extfile $DEST_DIR/${CN}-extfile.cnf -extensions SAN

# KEYSTORE_PWD=dontChangeIt
# poulate key store
# echo "Generate client keystore using openssl"
# echo "Generate client keystore using openssl"
# openssl pkcs12 -export -name ${CN} \
# 		-in $DEST_DIR/${CN}-cert.pem -inkey $DEST_DIR/${CN}-key.pem \
# 		-out $DEST_DIR/${CN}-keystore.p12 -chain \
# 		-CAfile $SSL_DIR/ca-cert.pem -caname root \
# 		-password pass:$KEYSTORE_PWD

# echo "Generated key store in : $DEST_DIR/${CN}-keystore.p12"
