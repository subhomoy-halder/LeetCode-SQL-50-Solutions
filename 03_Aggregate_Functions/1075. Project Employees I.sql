/* PROBLEM: 1075. Project Employees I
DIFFICULTY: Easy
TOPIC: Aggregate Functions & Multi-Table Joins

LOGIC:
The objective is to calculate the average experience years of employees for 
each project. We join the 'Project' table (mapping projects to employees) 
with the 'Employee' table to retrieve the 'experience_years' attribute, 
then group by project to perform the average calculation.

ARCHITECTURAL NOTE: 
1. Numeric Precision: In PostgreSQL, performing an AVG() on integer columns 
   can sometimes lead to truncation. Multiplying the column by 1.0 (or 
   casting to numeric) ensures that the division is performed using 
   floating-point arithmetic before the ROUND(..., 2) operation.
2. Join Strategy: We utilize a LEFT JOIN starting from the 'Project' table 
   to ensure that even if a project has employees with missing experience 
   data (though not the case here), the project_id remains in the report.
3. Indexing for Aggregation: For large-scale production databases, a 
   composite index on (project_id, employee_id) would allow the engine 
   to perform a "Covering Index Scan," significantly speeding up the 
   GROUP BY operation.
*/

SELECT
    a.project_id,
    ROUND(AVG(b.experience_years * 1.0), 2) AS average_years
FROM project AS a
LEFT JOIN employee AS b
  ON a.employee_id = b.employee_id
GROUP BY a.project_id
ORDER BY a.project_id;
