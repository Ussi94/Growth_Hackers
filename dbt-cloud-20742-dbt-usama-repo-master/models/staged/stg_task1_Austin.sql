# Task 1: Top20
SELECT start_station_name AS station, SUM(duration_minutes) AS sum_duration
FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
WHERE start_time > (
    SELECT DATE_SUB(MAX(start_time),INTERVAL 7 DAY)
    FROM `bigquery-public-data.austin_bikeshare.bikeshare_trips`
    )
GROUP BY start_station_name
ORDER BY sum_duration DESC
limit 20
# Results saved in file 'Aus_top20'
