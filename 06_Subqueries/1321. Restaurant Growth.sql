/* PROBLEM: 1321. Restaurant Growth
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Time-Series Analysis

LOGIC:
The objective is to calculate a 7-day moving sum and moving average for restaurant 
earnings. We first aggregate raw transactions into a 'daily_earning' CTE. Then, 
we use window functions with a specific frame ('ROWS BETWEEN 6 PRECEDING AND 
CURRENT ROW') to calculate the 7-day rolling metrics.

ARCHITECTURAL NOTE: 
1. Two-Step Aggregation: Raw data is often granular (multiple transactions per 
   day). By grouping to the 'daily' level first, we ensure the window function 
   operates on a consistent temporal grain, which is vital for accurate 
   time-series analysis.
2. Window Frame Precision: Explicitly defining the frame ensures the calculation 
   is mathematically correct regardless of the physical storage order of the 
   rows. Using 'ROWS BETWEEN' is more performant than a triangular join for 
   moving averages.
3. Edge Case Handling: By using a 'num_rows' window count, we effectively 
   filter out the first 6 days of the dataset where a full 7-day window 
   does not yet exist, fulfilling the business requirement for a complete 
   rolling week.
4. Floating-Point Math: Dividing by '7.0' ensures the average is calculated 
   with decimal precision in PostgreSQL before rounding.
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
