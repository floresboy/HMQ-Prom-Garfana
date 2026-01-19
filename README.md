HiveMQ + Prometheus + Grafana stack

### Notice:

Make sure the promethius extention JARfile (https://github.com/hivemq/hivemq-prometheus-extension/releases/download/4.0.15/hivemq-prometheus-extension-4.0.15.zip) is in the Promethius extention directory.

### How to run:

```docker compose up -d```

### Access:

2. HiveMQ Control Center: `http://localhost:8080` (cc-admin / cc-password)
3. MQTT broker: `tcp://localhost:1883` (full control: superuser / admin)
4. Prometheus: `http://localhost:9090`
5. Grafana: `http://localhost:3000` (admin/admin)

https://www.hivemq.com/blog/visualizing-hivemq-cluster-and-node-metrics-grafana/
https://github.com/hivemq/hivemq-grafana-dashboards
https://docs.hivemq.com/hivemq-enterprise-security-extension/latest/getting-started.html#getting-started-with-sql-databases

`mqtt sub -t "#" {"temperature": 25.74, "timestamp": "2025-12-06T14:27:57.316401Z"} {"temperature": 23.36, "timestamp": "2025-12-06T14:28:02.318782Z"}`

Grafana query used by sensor graph:

SELECT
isotime AS "time",      -- Time column for X-axis
temperature AS "value"  -- Value column for Y-axis
FROM
tempdata
ORDER BY
isotime ASC;

mqtt sub -t "#" -u superuser -pw admin -p 1883 -J | jq

pip install paho-mqtt  --root-user-action=ignore

mqtt test -u superuser -pw admin -p 1883                    # file realm superuser / admin
mqtt test -u "superuser" -pw supersecurepassword -p 1884    # DB realm /   superuser / supersecurepassword
mqtt pub -u sensor -pw password -t sensors/testsensor -m 123

# TLS test

mqtt test 
-u superuser -pw admin 
-h localhost 
-p 8883 
--secure 
--cafile hivemq.crt

openssl x509 -in hivemq.crt -text -noout

zip -r ../AddContextToSensors-1.0.0.module .

