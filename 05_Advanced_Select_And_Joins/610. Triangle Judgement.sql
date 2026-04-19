/* PROBLEM: 610. Triangle Judgement
DIFFICULTY: Easy
TOPIC: Advanced Select and Joins & Conditional Logic

LOGIC:
The objective is to determine if three given line segments (x, y, z) can form a 
triangle. According to the Triangle Inequality Theorem, a triangle is valid if 
the sum of any two sides is greater than the third side.

ARCHITECTURAL NOTE: 
1. Conditional Logic via CASE: The CASE statement is a powerful tool for 
   implementing row-level business rules. In this context, it allows us to 
   derive a categorical 'Yes/No' result directly from numeric attributes.
2. Predicate Efficiency: We evaluate three distinct conditions ($x + y > z$, 
   $x + z > y$, and $y + z > x$). The SQL engine evaluates these as boolean 
   expressions. For a valid triangle, all three must return TRUE.
3. Scalability: This pattern of "Attribute Validation" is common in data 
   cleansing pipelines where records must meet specific physical or logical 
   constraints before being processed for further analysis.
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
