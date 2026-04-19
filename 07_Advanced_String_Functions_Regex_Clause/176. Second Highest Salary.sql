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

ARCHITECTURAL NOTE: 
1. Implicit Null Handling: A key requirement of this problem is to return 
   NULL if there is no second highest salary. By using 'SELECT MAX(salary)' 
   on an empty result set (which occurs if all employees have the same 
   salary or the table has fewer than two rows), SQL naturally returns NULL 
   without requiring an explicit COALESCE or IFNULL.
2. Scalar Subquery Efficiency: Since the subquery is non-correlated, it is 
   evaluated only once by the database engine, making this approach highly 
   efficient for standard employee tables.
3. Resilience to Gaps: Unlike solutions using 'OFFSET 1', this approach 
   correctly handles cases where there are multiple employees with the same 
   top salary (ties), as it focuses on the distinct mathematical maximums.
*/

SELECT
    MAX(salary) AS secondhighestsalary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);
