/* PROBLEM: 1934. Confirmation Rate
DIFFICULTY: Medium
TOPIC: Basic Joins & Aggregate Logic

LOGIC:
The objective is to calculate the confirmation rate for each user. We first 
aggregate confirmation actions in a CTE and then join this result to the 
'Signups' table. This ensures that users who never requested a confirmation 
are still included with a rate of 0.00.
*/

WITH confirm_cte AS (
    SELECT
        user_id,
        COALESCE(SUM(CASE WHEN action = 'confirmed' THEN 1 END), 0) AS count_confirm,
        COUNT(*) AS count_action
    FROM confirmations
    GROUP BY user_id
)
SELECT
    a.user_id,
    ROUND(COALESCE((b.count_confirm * 1.0) / NULLIF(COALESCE(b.count_action, 0), 0), 0.0), 2) AS confirmation_rate
FROM signups AS a
LEFT JOIN confirm_cte AS b
ON a.user_id = b.user_id;
