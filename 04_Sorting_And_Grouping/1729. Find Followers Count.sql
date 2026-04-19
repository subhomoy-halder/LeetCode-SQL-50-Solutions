/* PROBLEM: 1729. Find Followers Count
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Social Graph Aggregation

LOGIC:
The objective is to calculate the total follower count for every user in a 
social media database. We utilize the GROUP BY clause on 'user_id' and 
perform a count on the 'follower_id' column to determine the size of each 
user's following.

ARCHITECTURAL NOTE: 
1. Social Graph Modeling: This table represents a directed edge in a graph 
   (User A follows User B). Aggregating these edges is a fundamental operation 
   for building social discovery features and ranking algorithms.
2. Primary Key Leverage: Since (user_id, follower_id) is the primary key, we are 
   guaranteed no duplicate follow records exist. Therefore, a standard 
   COUNT(follower_id) is equivalent to COUNT(DISTINCT follower_id) but is 
   computationally cheaper.
3. Deterministic Ordering: The requirement specifies an ORDER BY 'user_id'. 
   In production, ensuring a deterministic sort order is critical for paginated 
   API results and consistent reporting across different database nodes.
*/

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id;
