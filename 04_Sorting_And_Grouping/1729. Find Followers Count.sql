/* PROBLEM: 1729. Find Followers Count
DIFFICULTY: Easy
TOPIC: Sorting and Grouping & Social Graph Aggregation

LOGIC:
The objective is to calculate the total follower count for every user in a 
social media database. We utilize the GROUP BY clause on 'user_id' and 
perform a count on the 'follower_id' column to determine the size of each 
user's following.
*/

SELECT
    user_id,
    COUNT(follower_id) AS followers_count
FROM followers
GROUP BY user_id
ORDER BY user_id;
