/* PROBLEM: 1321. Restaurant Growth
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Time-Series Analysis

LOGIC:
The objective is to calculate a 7-day moving sum and moving average for restaurant 
earnings. We first aggregate raw transactions into a 'daily_earning' CTE. Then, 
we use window functions with a specific frame ('ROWS BETWEEN 6 PRECEDING AND 
CURRENT ROW') to calculate the 7-day rolling metrics.
*/

WITH daily_earning AS (
    SELECT
        visited_on,
        SUM(amount) AS earnings
    FROM customer
    GROUP BY visited_on
), aggregates AS (
    SELECT
        visited_on,
        SUM(earnings) OVER(
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        SUM(earnings) OVER(
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) / 7.0 AS average_amount,
        COUNT(visited_on) OVER(
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS num_rows
    FROM daily_earning
)
SELECT
    visited_on,
    amount,
    ROUND(average_amount, 2) AS average_amount
FROM aggregates
WHERE num_rows = 7
ORDER BY visited_on;
