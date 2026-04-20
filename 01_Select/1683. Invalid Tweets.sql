/* PROBLEM: 1683. Invalid Tweets
DIFFICULTY: Easy
TOPIC: Selection & String Manipulation

LOGIC:
The objective is to filter records based on the character length of a 'varchar' 
column. We utilize the LENGTH() function to evaluate the content and return 
only those 'tweet_id's where the character count strictly exceeds 15.
*/

SELECT 
    tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
