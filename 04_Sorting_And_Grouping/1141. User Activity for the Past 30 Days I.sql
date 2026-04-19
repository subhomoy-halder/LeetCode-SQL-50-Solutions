/* PROBLEM: 1141. User Activity for the Past 30 Days I 
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Temporal Filtering

LOGIC:
The objective is to calculate the Daily Active Users (DAU) for a specific 
30-day window. We filter the 'Activity' table for records falling between 
2019-06-28 and 2019-07-27, then aggregate the unique users per day 
.

ARCHITECTURAL NOTE: 
1. DAU Calculation: Using 'COUNT(DISTINCT user_id)' is the industry standard 
   for measuring user engagement. It ensures that a single user performing 
   multiple actions (e.g., 'open_session' and 'send_message') in one day is 
   only counted once.
2. Temporal Windowing: The 'BETWEEN' predicate is utilized here for a fixed 
   reporting period. In a dynamic production environment, this would typically 
   be replaced with relative date arithmetic (e.g., CURRENT_DATE - INTERVAL '29 days').
3. Grouping Strategy: By grouping on 'activity_date', we create a time-series 
   dataset. This is the foundational step for generating trend lines in 
   business intelligence tools like Tableau or PowerBI.
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
