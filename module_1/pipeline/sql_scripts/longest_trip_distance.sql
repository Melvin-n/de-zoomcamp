select 
	date_trunc('day', lpep_pickup_datetime) as day,
	sum(trip_distance) as total_trip_distance
from green_trip_data  
where trip_distance < 100
group by date_trunc('day', lpep_pickup_datetime), trip_distance
order by total_trip_distance desc;
