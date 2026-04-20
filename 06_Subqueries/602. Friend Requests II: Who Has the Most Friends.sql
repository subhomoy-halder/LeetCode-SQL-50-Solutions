/* PROBLEM: 602. Friend Requests II: Who Has the Most Friends
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Social Graph Analysis

LOGIC:
The objective is to find the person with the highest number of friends. Since 
a friendship is mutual, we must count an individual whether they appear as 
the 'requester_id' or the 'accepter_id'. We use UNION ALL to combine both 
columns into a single pool of IDs, group them, and then rank them by frequency.
*/

WITH all_id AS (
    SELECT accepter_id FROM requestaccepted
    UNION ALL
    SELECT requester_id FROM requestaccepted
), aggregates AS (
    SELECT
        accepter_id AS id,
        COUNT(accepter_id) AS num,
        DENSE_RANK() OVER(ORDER BY COUNT(accepter_id) DESC) AS rank_num
    FROM all_id
    GROUP BY accepter_id
)
SELECT
    id,
    num
FROM aggregates
WHERE rank_num = 1;
