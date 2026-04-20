/* PROBLEM: 196. Delete Duplicate Emails
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause

LOGIC:
The objective is to remove all duplicate email addresses from the 'Person' 
table, keeping only the one with the smallest 'id'. We identify the target 
IDs for deletion by:
1. Creating a subquery that assigns a ROW_NUMBER() to each email, partitioned 
   by the email address and ordered by ID.
2. Filtering for all records where the row number is greater than 1 (meaning 
   they are duplicates of the record with the minimum ID).
*/

DELETE FROM person
WHERE id IN (
    SELECT id
    FROM (
        SELECT 
            id, 
            ROW_NUMBER() OVER(PARTITION BY email ORDER BY id) AS rn
        FROM person
    ) AS sub
    WHERE rn > 1
);
