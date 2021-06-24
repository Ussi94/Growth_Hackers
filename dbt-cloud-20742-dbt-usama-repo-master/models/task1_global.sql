# Task 1: Top 20 performing stations globally in terms of duration in the last month of the provided datasets
SELECT station, ROUND(sum_duration) AS duration, 'New York' as Which_table
FROM {{ ref('stg_task1_NewYork') }}
UNION ALL
SELECT station, ROUND(sum_duration) AS duration, 'Austin' as Which_table 
FROM {{ ref('stg_task1_Austin') }}
UNION ALL
SELECT station, ROUND(sum_duration) AS duration, 'London' as Which_table
FROM  {{ ref('stg_task1_London') }}
ORDER BY duration DESC
limit 20