        HiveMQ + Prometheus + Grafana stack

place the promethius extention JARfile (https://github.com/hivemq/hivemq-prometheus-extension/releases/download/4.0.15/hivemq-prometheus-extension-4.0.15.zip)
in the Promethius extention directory

        How to run:


        1. docker compose up -d
        2. HiveMQ Control Center: http://localhost:8080
        3. MQTT broker: tcp://localhost:1883
        4. Prometheus: http://localhost:9090
        5. Grafana: http://localhost:3000 (admin/admin)





https://www.hivemq.com/blog/visualizing-hivemq-cluster-and-node-metrics-grafana/

https://github.com/hivemq/hivemq-grafana-dashboards

Grafana soure is
http://Promethius:9090

mqtt sub -t "#"
{"temperature": 25.74, "timestamp": "2025-12-06T14:27:57.316401Z"}
{"temperature": 23.36, "timestamp": "2025-12-06T14:28:02.318782Z"}

SELECT
    isotime AS "time",      -- Time column for X-axis
    temperature AS "value"  -- Value column for Y-axis
FROM
    tempdata
ORDER BY
    isotime ASC;



mqtt sub -t "#" -u mqtt-user-1 -pw mqtt-password-1   



curl -s -H "Authorization: Bearer glsa_9Gd60WGPfwNFYZZDaWuKgEKqUJzlXlzK_dbbae061" \
     http://0.0.0.0:3000/api/datasources


curl -s -H "Authorization: Bearer glsa_9Gd60WGPfwNFYZZDaWuKgEKqUJzlXlzK_dbbae061" \
     http://localhost:3000/api/datasources \
  | jq 'map(del(.id,.uid,.orgId,.version,.created,.updated,.readOnly))' \
  | yq -P 


pip install paho-mqtt  --root-user-action=ignore