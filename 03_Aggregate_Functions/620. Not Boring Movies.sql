/* PROBLEM: 620. Not Boring Movies
DIFFICULTY: Easy
TOPIC: Basic Filtering & Sorting

LOGIC:
The objective is to filter for movies with an odd-numbered ID and a description 
that is not "boring". The results are then sorted by rating in descending 
order to prioritize higher-quality content.
*/

SELECT 
    id, 
    movie, 
    description, 
    rating
FROM cinema
WHERE id % 2 = 1 
  AND description != 'boring'
ORDER BY rating DESC;
