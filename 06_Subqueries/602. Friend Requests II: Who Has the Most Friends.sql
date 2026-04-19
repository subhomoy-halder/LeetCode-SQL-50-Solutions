/* PROBLEM: 602. Friend Requests II: Who Has the Most Friends
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Social Graph Analysis

LOGIC:
The objective is to find the person with the highest number of friends. Since 
a friendship is mutual, we must count an individual whether they appear as 
the 'requester_id' or the 'accepter_id'. We use UNION ALL to combine both 
columns into a single pool of IDs, group them, and then rank them by frequency 
.

ARCHITECTURAL NOTE: 
1. Social Graph Modeling: In a social network database, a "friendship" is an 
   undirected edge. By using 'UNION ALL' to stack the columns, we effectively 
   transform the undirected edge into a directed format that is easier to 
   aggregate.
2. Ranking vs. Limit: We utilize 'DENSE_RANK()' to identify the top user. This 
   approach is more robust than a simple 'LIMIT 1' because it correctly 
   handles "ties"—if multiple people have the same maximum number of friends, 
   all of them will be reported.
3. Performance: The 'UNION ALL' operation is highly efficient as it does not 
   perform any internal deduplication (unlike 'UNION'). This allows the 
   engine to stream the results directly into the aggregation phase, 
   minimizing memory overhead.
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
