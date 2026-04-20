/* PROBLEM: 550. Game Play Analysis IV
DIFFICULTY: Medium
TOPIC: Aggregate Functions & Window Functions

LOGIC:
The objective is to calculate the Day-1 retention rate: the fraction of 
players who logged in again exactly one day after their first login. 
We use ROW_NUMBER() to identify the first login and LEAD() to find the 
interval until the subsequent login.
*/

WITH player_logs AS (
    SELECT
        player_id,
        LEAD(event_date) OVER(PARTITION BY player_id ORDER BY event_date) - event_date AS log_days,
        ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS init_log
    FROM activity
)
SELECT
    ROUND(
        (SUM(CASE WHEN init_log = 1 AND log_days = 1 THEN 1 ELSE 0 END) * 1.0 / 
        NULLIF(COUNT(DISTINCT player_id), 0))::numeric, 
    2) AS fraction
FROM player_logs;
