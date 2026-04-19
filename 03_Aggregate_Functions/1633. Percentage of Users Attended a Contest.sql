/* PROBLEM: 1633. Percentage of Users Attended a Contest
DIFFICULTY: Easy
TOPIC: Aggregate Functions & Scalar Subqueries

LOGIC:
The objective is to calculate the participation rate for every contest as a 
percentage of the total user base. We utilize a CTE to aggregate registrations 
per contest and a scalar subquery to fetch the total count of unique users 
from the 'Users' table.

ARCHITECTURAL NOTE: 
1. Scalar Subqueries: Using '(SELECT COUNT(*) FROM users)' inside the CTE is 
   an efficient way to retrieve a global constant. In modern SQL engines, 
   this is typically evaluated once and cached, preventing redundant table 
   scans during the aggregation of the 'Register' table.
2. Percentage Calculation: Multiplying the count by 1.0 and then the result by 
   100.0 ensures high-precision floating-point arithmetic. This prevents 
   integer truncation before the final ROUND(..., 2) operation.
3. Deterministic Sorting: The requirement specifies a primary sort on 
   'percentage' (descending) and a secondary sort on 'contest_id' (ascending). 
   This ensures consistent output even when multiple contests have identical 
   participation rates.
*/

WITH user_registration AS (
    SELECT
        contest_id,
        COUNT(user_id) * 1.0 AS user_reg,
        (SELECT COUNT(*) FROM users) AS total_users
    FROM register
    GROUP BY contest_id
)
SELECT
    contest_id,
    ROUND(COALESCE(user_reg / total_users, 0) * 100.0, 2) AS percentage
FROM user_registration
ORDER BY percentage DESC, contest_id ASC;
