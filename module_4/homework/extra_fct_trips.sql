-- Creating fact table for trips, based on lecture 4.4.2

-- My assumption was that duplicates were caused by trips having been paid by multiple methods
-- causing duplicate rows, with only the payment_type differing
-- This solution aggregates the payment_type(s) into an array


with all_trips as (
    select 
        hash(
            vendor_id,
            pickup_datetime,
            dropoff_datetime,
            pickup_location_id,
            dropoff_location_id
        ) as trip_id,

        vendor_id, 
        rate_code_id,
        pickup_datetime,
        dropoff_datetime,
        dropoff_location_id,
        pickup_location_id,
        store_and_fwd_flag, 
        passenger_count,
        fare_amount,
        extra,
        mta_tax,
        tip_amount,
        tolls_amount,
        ehail_fee,
        improvement_surcharge,
        total_amount,
        {{ get_payment_type('payment_type') }} as payment_type

    from {{ ref("int_trips_unioned") }}
),

-- get trip_ids and the amount of times they appear
trip_counts as (
    select
        trip_id,
        count(*) as cnt
    from all_trips
    group by trip_id
),

-- get duplicated trip_ids
dupe_ids as (
    select trip_id
    from trip_counts
    where cnt > 1
),

-- take dupe ids group them, array_agg the payment types, and join them to the table,
-- producing a table with 1 copy of the dupes, and an array of payment types
dupes_aggregated as (
    select
        t.trip_id,
        any_value(vendor_id) as vendor_id,
        any_value(rate_code_id) as rate_code_id,
        any_value(pickup_datetime) as pickup_datetime,
        any_value(dropoff_datetime) as dropoff_datetime,
        any_value(dropoff_location_id) as dropoff_location_id,
        any_value(pickup_location_id) as pickup_location_id,
        any_value(store_and_fwd_flag) as store_and_fwd_flag,
        any_value(passenger_count) as passenger_count,
        any_value(fare_amount) as fare_amount,
        any_value(extra) as extra,
        any_value(mta_tax) as mta_tax,
        any_value(tip_amount) as tip_amount,
        any_value(tolls_amount) as tolls_amount,
        any_value(ehail_fee) as ehail_fee,
        any_value(improvement_surcharge) as improvement_surcharge,
        any_value(total_amount) as total_amount,
        array_agg(distinct payment_type) as payment_types

    from all_trips t
    join dupe_ids d
        on t.trip_id = d.trip_id
    group by t.trip_id
),

-- join non dupes to all trips, only keeping the rows which don't have a dupe trip_id
non_dupes as (
    select
        t.trip_id,
        t.vendor_id,
        t.rate_code_id,
        t.pickup_datetime,
        t.dropoff_datetime,
        t.dropoff_location_id,
        t.pickup_location_id,
        t.store_and_fwd_flag,
        t.passenger_count,
        t.fare_amount,
        t.extra,
        t.mta_tax,
        t.tip_amount,
        t.tolls_amount,
        t.ehail_fee,
        t.improvement_surcharge,
        t.total_amount,
        [t.payment_type] as payment_types
    from all_trips t
    left join dupe_ids d
        on t.trip_id = d.trip_id
    where d.trip_id is null
)

select * from dupes_aggregated
union all
select * from non_dupes
