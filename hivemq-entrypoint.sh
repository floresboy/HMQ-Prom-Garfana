#!/bin/sh

# Remove DISABLED flagfile
echo "🔧 Removing DISABLED flagfile..."
rm -rf /opt/hivemq/extensions/hivemq-enterprise-security-extension/DISABLED
echo "✅ Security extention is enabled!"


# Remove DISABLED flagfile
echo "🔧 Removing DISABLED flagfile..."
rm -rf /opt/hivemq/extensions/hivemq-postgresql-extension/DISABLED
echo "✅ Postgres is ready!"

# create DISABLED flagfile
echo "🔧 Adding DISABLED flagfile..."
touch /opt/hivemq/extensions/hivemq-allow-all-extension/DISABLED
echo "✅ Allow all is disabled is ready!"


# Start HiveMQ
echo "🚀 Starting HiveMQ..."
exec /opt/hivemq/bin/run.sh