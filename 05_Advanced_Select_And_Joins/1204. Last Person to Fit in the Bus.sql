/* PROBLEM: 1204. Last Person to Fit in the Bus
DIFFICULTY: Medium
TOPIC: Advanced Select and Joins & Window Functions

LOGIC:
The objective is to find the last person who can board the bus without the 
cumulative weight exceeding 1,000kg. We calculate a running total of the 
weights based on the boarding order ('turn') and then filter for the 
highest 'turn' value that remains within the limit.
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
