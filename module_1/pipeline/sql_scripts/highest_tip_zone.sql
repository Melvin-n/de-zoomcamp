select 
	max(tip_amount) as highest_tip,
	zdu."Zone" AS dropoff_zone
from
	green_trip_data t
	join zones zpu on t."PULocationID" = zpu."LocationID"
	join zones zdu on t."DOLocationID" = zdu."LocationID"
where zpu."Zone" = 'East Harlem North'
group by dropoff_zone
order by highest_tip desc;
