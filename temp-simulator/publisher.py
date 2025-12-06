import json
import os
import random
import time
from datetime import datetime
from datetime import datetime, timezone

import paho.mqtt.client as mqtt

host = os.getenv("MQTT_HOST", "localhost")
port = int(os.getenv("MQTT_PORT", "1883"))
topic = os.getenv("MQTT_TOPIC", "sensors/temperature")
interval = int(os.getenv("INTERVAL", "5"))
username = os.getenv("MQTT_USER", "sensor")       # MQTT username
password = os.getenv("MQTT_PASSWORD", "password")   # MQTT password
client_id = "sim"

# ----------------------------
# MQTT Client Setup
# ----------------------------
# client = mqtt.Client()

# client = mqtt.Client(callback_api_version=mqtt.CallbackAPI_V2)
# client = mqtt.Client(callback_api_version=mqtt.CallbackAPIVersion.V2)

# Source - https://stackoverflow.com/a.  
# Posted by Brits, modified by community. See post 'Timeline' for change history
# Retrieved 2025-12-06, License - CC BY-SA 4.0

client = mqtt.Client(mqtt.CallbackAPIVersion.VERSION2, client_id)



client.username_pw_set(username=username, password=password)
client.connect(host, port, 60)

print(f"Starting temperature publisher → {host}:{port}, topic='{topic}'")

# ----------------------------
# Publish loop with success/failure check
# ----------------------------
try:
    while True:
        message = {
            "temperature": round(random.uniform(2.0, 35.0), 2),
            "isotime": datetime.now(timezone.utc).isoformat(timespec="milliseconds").replace("+00:00", "Z"),
            "SensorID": "TempSimulator",
            "unixtime": int(time.time() * 1000)
        }
        payload = json.dumps(message)

        # Publish and get result
        result = client.publish(topic, payload)
        
        # Check if publish was successful
        status = result.rc  # return code
        if status == mqtt.MQTT_ERR_SUCCESS:
            print(f"✅ Successfully published to '{topic}': {payload}")
        else:
            print(f"❌ Failed to publish to '{topic}', error code: {status}")

        time.sleep(interval)

except KeyboardInterrupt:
    print("Stopping publisher...")
    client.disconnect()