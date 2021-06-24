# Task 1: Top 20
SELECT start_station_name AS station, ROUND(SUM(tripduration)/60) AS sum_duration
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime > (
    SELECT DATE_SUB(MAX(starttime),INTERVAL 7 DAY)
    FROM `bigquery-public-data.new_york_citibike.citibike_trips`
    )
GROUP BY start_station_name
ORDER BY sum_duration DESC
limit 20
# Results saved in file 'NY_top20'
