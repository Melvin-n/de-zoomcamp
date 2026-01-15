
-- this is an implicit join (outdated, should not be used)
select 
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	CONCAT(zpu."Borough", '/', zpu."Zone") AS pickup_loc,
	CONCAT(zdo."Borough", '/', zdo."Zone") AS dropoff_loc
from
	yellow_taxi_trips_2021_2 t,
	zones zpu,
	zones zdo
where
	t."PULocationID" = zpu."LocationID" and
	t."DOLocationID" = zdo."LocationID"
limit 100;

-- lets try to make that into an explicit join (proper, ANSI)
select 
	tpep_pickup_datetime,
	tpep_dropoff_datetime,
	total_amount,
	CONCAT(zpu."Borough", '/', zpu."Zone") AS pickup_loc,
	CONCAT(zdo."Borough", '/', zdo."Zone") AS dropoff_loc
from
	yellow_taxi_trips_2021_2 t
	join zones zpu on t."PULocationID" = zpu."LocationID"
	join zones zdo on t."DOLocationID" = zdo."LocationID"
limit 100;