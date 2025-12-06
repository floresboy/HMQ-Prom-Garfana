INSERT INTO mqtt_to_postgresql_table(topic, payload_utf8, qos, retain, packet_id, payload_format_indicator,
                                     response_topic, correlation_data_utf8, user_properties, arrival_timestamp)
VALUES (${mqtt-topic},
        ${mqtt-payload-utf8},
        ${mqtt-qos},
        ${mqtt-retain},
        ${mqtt-packet-id},
        ${mqtt-payload-format-indicator},
        ${mqtt-response-topic},
        ${mqtt-correlation-data-utf8},
        ${mqtt-user-properties-json},
        ${timestamp-iso-8601});
        