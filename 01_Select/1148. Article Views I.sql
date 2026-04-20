/* PROBLEM: 1148. Article Views I
DIFFICULTY: Easy
TOPIC: Selection & Deduplication

LOGIC:
The goal is to identify authors who have viewed their own content (where author_id 
equals viewer_id). Because the table lacks a primary key and may contain 
duplicate entries for the same view event, deduplication is mandatory.
*/

SELECT 
    DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
