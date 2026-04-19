/* PROBLEM: 1204. Last Person to Fit in the Bus
DIFFICULTY: Medium
TOPIC: Advanced Select and Joins & Window Functions

LOGIC:
The objective is to find the last person who can board the bus without the 
cumulative weight exceeding 1,000kg. We calculate a running total of the 
weights based on the boarding order ('turn') and then filter for the 
highest 'turn' value that remains within the limit.

ARCHITECTURAL NOTE: 
1. Running Totals via Window Functions: We use 'SUM(weight) OVER(ORDER BY turn)' 
   to calculate a cumulative sum. Defining the window frame explicitly as 
   'ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW' ensures the engine 
   processes the sum correctly for every person in the queue.
2. Filter-Then-Sort Strategy: By wrapping the calculation in a CTE ('weight_sum'), 
   we can filter the results in the outer query. Sorting by 'turn DESC' and 
   applying 'LIMIT 1' is an efficient way to isolate the "last" valid record 
   in the sequence.
3. Performance: This approach is significantly more performant than a 
   triangular self-join (O(N^2)). Using a window function allows the database 
   to compute the result in a single linear pass (O(N)) after the initial sort.
*/

WITH weight_sum AS (
    SELECT
        turn,
        person_name,
        SUM(weight) OVER(
            ORDER BY turn 
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS weight_total
    FROM queue
)
SELECT
    person_name
FROM weight_sum
WHERE weight_total <= 1000
ORDER BY turn DESC
LIMIT 1;
