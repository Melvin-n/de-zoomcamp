-- queries ran on bigquery

SELECT COUNT(DISTINCT(PULocationID)) FROM  `zoomcamp.yellow_taxi_2024_table`;

SELECT COUNT(DISTINCT(PULocationID)) FROM  `zoomcamp.yellow_taxi_2024`;

SELECT PULocationID FROM `zoomcamp.yellow_taxi_2024_table`;

SELECT PULocationID, DOLocationID FROM `zoomcamp.yellow_taxi_2024_table`;

SELECT count(*) FROM `zoomcamp.yellow_taxi_2024_table` WHERE fare_amount = 0;

CREATE TABLE `zoomcamp.yellow_taxi_2024_optimized`
PARTITION BY DATE(tpep_dropoff_datetime)
CLUSTER BY VendorID
AS SELECT * FROM zoomcamp.yellow_taxi_2024;

SELECT DISTINCT(VendorID) FROM `zoomcamp.yellow_taxi_2024_table` 
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';

SELECT DISTINCT(VendorID) FROM `zoomcamp.yellow_taxi_2024_optimized` 
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';


SELECT COUNT(VendorID) FROM `zoomcamp.yellow_taxi_2024_table`;
