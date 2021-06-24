# Task 2: most successful subscriber type year-on-year
SELECT 
    subscriber_type, 
    SUM(duration_minutes) AS duration,
    EXTRACT(YEAR FROM DATE(start_time)) AS year,
    'Austin' AS location
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
GROUP BY subscriber_type, year
ORDER BY 
    year, 
    duration DESC