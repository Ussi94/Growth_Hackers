# Task 4: top cities last month
SELECT 
    CAST(ROUND(SUM(tripduration/60)) AS numeric) AS total_ride_duration,
    'New York' AS City
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime > (
    SELECT DATE_SUB(DATE(MAX(starttime)),INTERVAL 1 MONTH)
    FROM `bigquery-public-data.new_york_citibike.citibike_trips`
    )