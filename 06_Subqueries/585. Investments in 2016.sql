/* PROBLEM: 585. Investments in 2016
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Multi-Criteria Filtering

LOGIC:
The objective is to sum the total investment value for 2016 ('tiv_2016') for 
policyholders who meet two specific criteria:
1. They share the same 'tiv_2015' value with at least one other person.
2. They are located in a unique 'lat/lon' pair (not in the same city as 
   any other policyholder).
*/

WITH metrics AS (
    SELECT
        tiv_2016,
        COUNT(*) OVER(PARTITION BY tiv_2015) AS count_2015,
        COUNT(*) OVER(PARTITION BY lat, lon) AS loc
    FROM insurance
)
SELECT
    ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM metrics
WHERE count_2015 >= 2
  AND loc = 1;
