select 
	zpu."Zone" AS pickup_zone,
	sum(total_amount) as total_zone_amt
from
	green_trip_data t
	join zones zpu on t."PULocationID" = zpu."LocationID"
where date_trunc('day', lpep_pickup_datetime) = '2025-11-18'
group by pickup_zone
order by total_zone_amt desc;
