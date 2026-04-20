/* PROBLEM: 176. Second Highest Salary
DIFFICULTY: Medium
TOPIC: Subqueries & Aggregate Functions

LOGIC:
The objective is to find the second highest distinct salary. We achieve this 
using a scalar subquery:
1. The subquery '(SELECT MAX(salary) FROM employee)' finds the absolute 
   highest salary in the table.
2. The outer query then finds the MAX(salary) among all records where the 
   salary is strictly less than that maximum.
*/

SELECT
    MAX(salary) AS secondhighestsalary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);
