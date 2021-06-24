# Task 3: Last month riders breakdown by Age and Gender for New York
SELECT
    (2018 - birth_year) AS age,
    gender,
    COUNT(*) AS count_riders, 
    'New York' AS location
FROM `bigquery-public-data.new_york_citibike.citibike_trips`
WHERE starttime > (
    SELECT DATE_SUB(DATE(MAX(starttime)),INTERVAL 1 MONTH)
    FROM `bigquery-public-data.new_york_citibike.citibike_trips`
    )
GROUP BY age, gender
ORDER BY
    age,
    count_riders DESC