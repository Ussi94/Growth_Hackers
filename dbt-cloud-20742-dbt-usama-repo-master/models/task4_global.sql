# Task 4: Ranking most duration in the last month 
SELECT *
FROM {{ ref('stg_task4_Austin') }}
UNION ALL
SELECT *
FROM {{ ref('stg_task4_London') }}
UNION ALL
SELECT *
FROM {{ ref('stg_task4_NewYork') }}
ORDER BY total_ride_duration DESC