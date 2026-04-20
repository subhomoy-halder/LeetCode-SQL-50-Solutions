/* PROBLEM: 584. Find Customer Referee
DIFFICULTY: Easy
TOPIC: Selection & Three-Valued Logic (NULL Handling)

LOGIC:
The objective is to identify customers not referred by user #2. In SQL, the 
standard inequality operator (!=) evaluates to UNKNOWN when compared with a 
NULL value. Because a WHERE clause only returns rows where the condition is 
TRUE, rows with NULL 'referee_id' are filtered out by default unless 
explicitly handled with 'IS NULL'.
*/

SELECT 
    name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
