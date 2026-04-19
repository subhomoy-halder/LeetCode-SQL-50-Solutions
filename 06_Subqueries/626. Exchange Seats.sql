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

ARCHITECTURAL NOTE: 
1. Window Function vs. Arithmetic: While this can be solved by manipulating 
   the ID column (e.g., ID + 1, ID - 1), using LEAD() and LAG() is the 
   preferred modern approach. It maintains the original ID sequence as 
   an immutable primary key while only transforming the associated data.
2. Boundary Handling: The use of 'COALESCE(LEAD(student) ..., student)' 
   elegantly handles the "edge case" of the last student in a set with 
   an odd total count, fulfilling the business requirement without 
   requiring an expensive subquery to count the table.
3. Performance: Because window functions operate on the result set after 
   initial sorting, this query executes in O(N log N) time, making it highly 
   efficient even for large seating charts.
*/

SELECT
    id,
    CASE
        WHEN id % 2 = 1 THEN COALESCE(LEAD(student) OVER(ORDER BY id), student)
        ELSE LAG(student) OVER(ORDER BY id)
    END AS student
FROM seat;
