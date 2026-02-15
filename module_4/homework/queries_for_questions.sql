-- Question 3. Counting Records in fct_monthly_zone_revenue
select count (*) from taxi_rides_ny.prod.fct_monthly_zone_revenue;

-- Question 4. Best Performing Zone for Green Taxis (2020)
select
  sum(revenue_monthly_total_amount) as year_revenue,
  pickup_zone
from taxi_rides_ny.prod.fct_monthly_zone_revenue
where service_type = 'Green' and year(revenue_month) = '2020'
group by pickup_zone order by year_revenue desc;

-- Question 5. Green Taxi Trip Counts (October 2019)
select 
  sum(total_monthly_trips)
from taxi_rides_ny.prod.fct_monthly_zone_revenue
where service_type = 'Green' and revenue_month = '2019-10-01'

