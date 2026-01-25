-- Question 3. How many rows are there for the Yellow Taxi data for all CSV files in the year 2020?
SELECT COUNT(*) FROM `<project_id>.zoomcamp.yellow_tripdata` WHERE filename LIKE '%2020%';

-- Question 4. How many rows are there for the Green Taxi data for all CSV files in the year 2020?
SELECT COUNT(*) FROM `<project_id>.zoomcamp.green_tripdata` WHERE filename LIKE '%2020%';

--Question 5. How many rows are there for the Yellow Taxi data for the March 2021 CSV file? 
SELECT count(*) FROM `<project_id>.zoomcamp.yellow_tripdata` where filename LIKE '%2021-03%';