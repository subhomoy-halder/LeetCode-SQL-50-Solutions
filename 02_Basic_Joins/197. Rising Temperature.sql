/* PROBLEM: 197. Rising Temperature
DIFFICULTY: Easy
TOPIC: Basic Joins & Window Functions

LOGIC:
The objective is to identify days where the temperature is strictly higher than 
the immediate previous day. We utilize a Common Table Expression (CTE) to 
calculate the temporal and thermal differences using the LAG() window function 
across the 'recorddate' timeline.
*/

WITH records AS (
    SELECT
        id,
        recorddate - LAG(recorddate) OVER(ORDER BY recorddate) AS day_diff,
        temperature - LAG(temperature) OVER(ORDER BY recorddate) AS temp_diff
    FROM weather
)
SELECT
    id
FROM records
WHERE 
    day_diff = 1
    AND temp_diff > 0;
