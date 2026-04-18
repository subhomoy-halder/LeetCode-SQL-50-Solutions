/* PROBLEM: 1683. Invalid Tweets
DIFFICULTY: Easy
TOPIC: Selection & String Manipulation

LOGIC:
The objective is to filter records based on the character length of a 'varchar' 
column. We utilize the LENGTH() function to evaluate the content and return 
only those 'tweet_id's where the character count strictly exceeds 15.

ARCHITECTURAL NOTE: 
1. Non-SARGable Predicates: Applying a function like LENGTH() directly to a 
   column in the WHERE clause makes the query non-SARGable. This prevents the 
   engine from using a standard index on the 'content' column, necessitating 
   a Full Table Scan. In massive production datasets, this can lead to high 
   I/O and CPU overhead.
2. Character vs. Byte Length: In multi-byte character sets (like UTF-8), 
   LENGTH() may return the number of bytes while CHAR_LENGTH() returns the 
   actual character count. For this business rule, understanding the 
   database's character encoding is vital for accuracy.
*/

SELECT 
    tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;
