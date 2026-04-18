/* PROBLEM: 584. Find Customer Referee
DIFFICULTY: Easy
TOPIC: Selection & Three-Valued Logic (NULL Handling)

LOGIC:
The objective is to identify customers not referred by user #2. In SQL, the 
standard inequality operator (!=) evaluates to UNKNOWN when compared with a 
NULL value. Because a WHERE clause only returns rows where the condition is 
TRUE, rows with NULL 'referee_id' are filtered out by default unless 
explicitly handled with 'IS NULL'.

ARCHITECTURAL NOTE: 
1. Three-Valued Logic: Understanding that NULL is not a value but a "marker for 
   missing data" is critical. Explicitly checking 'OR referee_id IS NULL' 
   prevents logical data loss in nullable columns.
2. Predicate Optimization: Using 'COALESCE(referee_id, 0) != 2' is an 
   alternative, but using 'OR IS NULL' is often preferred for SARGability 
   (Search ARGumentability), as functions on columns can sometimes prevent 
   the engine from utilizing indexes.
*/

SELECT 
    name
FROM Customer
WHERE referee_id != 2 OR referee_id IS NULL;
