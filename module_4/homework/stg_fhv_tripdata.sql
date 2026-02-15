select 
    dispatching_base_num,
    pickup_datetime,
    dropoff_datetime,
    pulocationid as pickup_location_id,
    dolocationid as dropoff_location_id,
    sr_flag,
    affiliated_base_number
from {{ source('raw', 'fhv_tripdata') }}
where dispatching_base_num is not null