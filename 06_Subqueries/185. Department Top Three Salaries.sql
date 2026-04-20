/* PROBLEM: 185. Department Top Three Salaries
DIFFICULTY: Hard
TOPIC: Advanced Select And Joins & Window Functions

LOGIC:
The objective is to find "high earners" in each department, defined as 
employees who have a salary in the top three unique salaries for that 
department. We utilize DENSE_RANK() to handle ties in salary correctly, 
ensuring that multiple employees with the same top salary don't "push out" 
other high earners from the top three spots.
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
