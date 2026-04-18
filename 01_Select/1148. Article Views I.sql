/* PROBLEM: 1148. Article Views I
DIFFICULTY: Easy
TOPIC: Selection & Deduplication

LOGIC:
The goal is to identify authors who have viewed their own content (where author_id 
equals viewer_id). Because the table lacks a primary key and may contain 
duplicate entries for the same view event, deduplication is mandatory.

ARCHITECTURAL NOTE: 
1. Deduplication Strategy: Using DISTINCT is semantically cleaner than GROUP BY 
   when no aggregate functions (like COUNT or SUM) are involved. It instructs 
   the engine to perform a sort or hash-based unique operation on the result set.
2. Handling Heap Tables: Since this table has no primary key (a "heap"), it is 
   prone to data redundancy. In production, a composite index on 
   (author_id, viewer_id) would significantly optimize this query, allowing 
   the engine to perform an "Index-Only Scan."
3. Result Formatting: We alias 'author_id' as 'id' and apply an explicit 
   ORDER BY to satisfy the business requirement for ascending output.
*/

SELECT 
    DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
