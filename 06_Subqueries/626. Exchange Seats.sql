/* PROBLEM: 626. Exchange Seats
DIFFICULTY: Medium
TOPIC: Advanced Select And Joins & Window Functions

LOGIC:
The objective is to swap the seat IDs of every two consecutive students. 
We utilize a CASE statement to determine if an ID is odd or even. 
For odd IDs, we fetch the next student using LEAD(); for even IDs, 
we fetch the previous student using LAG(). COALESCE is used for the last 
student in an odd-numbered list to ensure they keep their own seat 
instead of returning NULL.
*/

SELECT
    id,
    CASE
        WHEN id % 2 = 1 THEN COALESCE(LEAD(student) OVER(ORDER BY id), student)
        ELSE LAG(student) OVER(ORDER BY id)
    END AS student
FROM seat;
