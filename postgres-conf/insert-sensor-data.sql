INSERT INTO tempdata (sensorid,isotime, unixtime, temperature)
SELECT
   json_data->>'SensorID' AS sensorid,
   (json_data->>'isotime'):: timestamp AS isotime,
   (json_data->>'unixtime')::numeric AS isotime,
   (json_data->>'temperature')::numeric AS temperature /* casting from text to numic value ! */
FROM (
   VALUES
       ( ${mqtt-payload-utf8}::jsonb)
) AS input(json_data);