/* PROBLEM: 197. Rising Temperature
DIFFICULTY: Easy
TOPIC: Basic Joins & Window Functions

LOGIC:
The objective is to identify days where the temperature is strictly higher than 
the immediate previous day. We utilize a Common Table Expression (CTE) to 
calculate the temporal and thermal differences using the LAG() window function 
across the 'recorddate' timeline.

ARCHITECTURAL NOTE: 
1. Window Functions vs. Self-Joins: While this is often taught as a self-join 
   problem, using LAG() is generally more performant. It allows the database 
   engine to resolve the logic in a single scan of the sorted data (O(N)), 
   avoiding the overhead of a Cartesian product or nested loop join.
2. PostgreSQL Date Arithmetic: PostgreSQL handles date subtraction natively by 
   returning an integer. This ensures the 'day_diff = 1' predicate 
   is SARGable and highly readable compared to complex DATEDIFF functions.
3. CTE Modularization: By abstracting the calculation of 'day_diff' and 
   'temp_diff' into a CTE, we improve code maintainability and allow for 
   easier unit testing of the intermediate calculation logic.
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
