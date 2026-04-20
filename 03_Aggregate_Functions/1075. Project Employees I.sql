/* PROBLEM: 1075. Project Employees I
DIFFICULTY: Easy
TOPIC: Aggregate Functions & Multi-Table Joins

LOGIC:
The objective is to calculate the average experience years of employees for 
each project. We join the 'Project' table (mapping projects to employees) 
with the 'Employee' table to retrieve the 'experience_years' attribute, 
then group by project to perform the average calculation.
*/

SELECT
    a.project_id,
    ROUND(AVG(b.experience_years * 1.0), 2) AS average_years
FROM project AS a
LEFT JOIN employee AS b
  ON a.employee_id = b.employee_id
GROUP BY a.project_id
ORDER BY a.project_id;
