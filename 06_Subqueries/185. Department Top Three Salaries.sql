/* PROBLEM: 185. Department Top Three Salaries
DIFFICULTY: Hard
TOPIC: Advanced Select And Joins & Window Functions

LOGIC:
The objective is to find "high earners" in each department, defined as 
employees who have a salary in the top three unique salaries for that 
department. We utilize DENSE_RANK() to handle ties in salary correctly, 
ensuring that multiple employees with the same top salary don't "push out" 
other high earners from the top three spots.

ARCHITECTURAL NOTE: 
1. Rank vs. Dense Rank: In high-stakes financial reporting, DENSE_RANK() is 
   crucial. If two employees share the #1 salary, RANK() would skip #2 and 
   label the next person as #3. DENSE_RANK() labels the next unique salary 
   as #2, which is the requirement for "top three unique salaries."
2. Partitioned Analysis: By partitioning the window function by 'departmentId', 
   we reset the ranking for every department. This allows a single query 
   pass to handle an infinite number of departments independently.
3. Logical Join Order: We perform the ranking in a CTE ('ranked_salary') 
   before joining with the 'Department' table. This minimizes the join 
   overhead by ensuring we only join names once the primary filtering logic 
   is calculated.
*/

WITH ranked_salary AS (
    SELECT
        departmentId,
        name AS employee,
        salary,
        DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS top_salary
    FROM employee
)
SELECT
    b.name AS department,
    a.employee,
    a.salary
FROM ranked_salary AS a
INNER JOIN department AS b
  ON a.departmentId = b.id
WHERE a.top_salary <= 3;
