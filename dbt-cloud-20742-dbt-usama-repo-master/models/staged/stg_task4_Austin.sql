# Task 4:
SELECT 
    CAST(ROUND(SUM(duration_minutes)) AS numeric) AS total_ride_duration,
    'Austin' AS City
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE EXTRACT(DATE FROM start_time AT TIME ZONE "UTC") > (
    SELECT
        DATE_SUB(EXTRACT(DATE FROM MAX(start_time) AT TIME ZONE "UTC"),INTERVAL 1 MONTH)
    FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
    )