/* PROBLEM: 1633. Percentage of Users Attended a Contest
DIFFICULTY: Easy
TOPIC: Aggregate Functions & Scalar Subqueries

LOGIC:
The objective is to calculate the participation rate for every contest as a 
percentage of the total user base. We utilize a CTE to aggregate registrations 
per contest and a scalar subquery to fetch the total count of unique users 
from the 'Users' table.
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
