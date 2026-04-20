/* PROBLEM: 1141. User Activity for the Past 30 Days I 
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Temporal Filtering

LOGIC:
The objective is to calculate the Daily Active Users (DAU) for a specific 
30-day window. We filter the 'Activity' table for records falling between 
2019-06-28 and 2019-07-27, then aggregate the unique users per day.
*/

WITH user_activity AS (
    SELECT
        activity_date AS day,
        COUNT(DISTINCT user_id) AS active_users
    FROM activity
    WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
    GROUP BY activity_date
)
SELECT * FROM user_activity;
