/* PROBLEM: 610. Triangle Judgement
DIFFICULTY: Easy
TOPIC: Advanced Select and Joins & Conditional Logic

LOGIC:
The objective is to determine if three given line segments (x, y, z) can form a 
triangle. According to the Triangle Inequality Theorem, a triangle is valid if 
the sum of any two sides is greater than the third side.
*/

SELECT
    x,
    y,
    z,
    CASE
        WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No'
    END AS triangle
FROM triangle;
