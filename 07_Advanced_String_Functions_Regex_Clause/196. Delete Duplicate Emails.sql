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

ARCHITECTURAL NOTE: 
1. Subquery for Deletion: PostgreSQL does not support 'DELETE FROM CTE'. 
   Therefore, we wrap the window function logic inside a standard subquery 
   within the 'WHERE id IN (...)' clause to identify the specific primary keys 
   targeted for removal.
2. Atomic Operation: This single-statement DELETE ensures atomicity. By 
   identifying the primary keys first, we prevent race conditions that could 
   occur with complex self-joins on large datasets.
3. Row Ranking Strategy: Using ROW_NUMBER() is mathematically cleaner than a 
   triangular join (a.id > b.id) because it allows for easy scalability—if 
   the requirement changed to "keep the top two emails," you would only 
   need to change the filter to 'rn > 2'.
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
