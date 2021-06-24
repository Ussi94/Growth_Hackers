* SQL commands within quotes:

### Task 1:
#### Top 20 
"""
SELECT start_station_name  AS station, SUM(duration)/60 AS sum_duration
FROM `bigquery-public-data.london_bicycles.cycle_hire`
WHERE start_date > (
    SELECT DATE_SUB(MAX(start_date),INTERVAL 7 DAY)
    from `bigquery-public-data.london_bicycles.cycle_hire`
    )
GROUP BY start_station_name
ORDER BY sum_duration DESC
limit 20
"""
Results saved as file 'Lond_top20'


### Task 4: 
#### Top cities last month
"""
SELECT 
    CAST(ROUND(SUM(duration/60)) AS numeric) AS total_ride_duration,
    'London' AS City
FROM `bigquery-public-data.london_bicycles.cycle_hire`
WHERE EXTRACT(DATE FROM start_date AT TIME ZONE "UTC") > (
    SELECT
        DATE_SUB(EXTRACT(DATE FROM MAX(start_date) AT TIME ZONE "UTC"),INTERVAL 1 MONTH)
    FROM `bigquery-public-data.london_bicycles.cycle_hire`
    )
"""
Results saved as file 'task4_Lond'
