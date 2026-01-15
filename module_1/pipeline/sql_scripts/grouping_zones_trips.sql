-- group by count of trips per day
select 
	CAST(tpep_dropoff_datetime AS DATE) AS day,
	"DOLocationID",
	COUNT(1) as count
FROM yellow_taxi_trips_2021
GROUP BY 
	CAST(tpep_dropoff_datetime AS DATE),
	"DOLocationID"
ORDER BY count desc;
