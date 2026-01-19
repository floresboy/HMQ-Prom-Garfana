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

### Check MQTT on CLI

mqtt sub -t "#"

### example JSON value as published by simulator

`{"temperature": 3.97, "isotime": "2026-01-19T11:49:39.172Z", "SensorID": "TempSimulator", "unixtime": 1768823379172}`

#### test:

mqtt sub -t "#" -u superuser -pw admin -p 1883 -J | jq

### Grafana query used by sensor graph:

SELECT
isotime AS "time",      -- Time column for X-axis
temperature AS "value"  -- Value column for Y-axis
FROM
tempdata
ORDER BY
isotime ASC;

#### Secure testing:

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

