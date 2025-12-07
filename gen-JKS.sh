#!/usr/bin/env bash

# === CONFIG ===
KEYSTORE_NAME="hivemq.jks"
ALIAS="hivemq"
KEYSTORE_PASSWORD="changeit"   # <-- update if needed
KEY_PASSWORD="changeit"         # usually same as keystore password
DAYS=365
DN="CN=localhost, OU=IT, O=MyOrg, L=City, S=State, C=US"

# === RUN ===

echo "Generating JKS keystore with keypair inside..."
keytool -genkeypair \
  -alias $ALIAS \
  -keyalg RSA \
  -keysize 2048 \
  -dname "$DN" \
  -validity $DAYS \
  -keystore $KEYSTORE_NAME \
  -storepass $KEYSTORE_PASSWORD \
  -keypass $KEY_PASSWORD

echo "Exporting public certificate to ${ALIAS}.crt..."
keytool -exportcert \
  -alias $ALIAS \
  -file ${ALIAS}.crt \
  -keystore $KEYSTORE_NAME \
  -storepass $KEYSTORE_PASSWORD

cp ${ALIAS}.crt ./Hive-config/hivemq.jks

echo "Done!"
echo "Generated:"
echo "  - $KEYSTORE_NAME (JKS keystore)"
echo "  - ${ALIAS}.crt (public certificate for clients)"
echo "copied to Hive-config for mounting"
echo "Use password: $KEYSTORE_PASSWORD in HiveMQ config.xml"