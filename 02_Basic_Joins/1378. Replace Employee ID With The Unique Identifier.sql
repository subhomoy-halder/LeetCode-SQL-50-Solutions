/* PROBLEM: 1378. Replace Employee ID With The Unique Identifier
DIFFICULTY: Easy
TOPIC: Basic Joins & Handling NULLs

LOGIC:
The objective is to display a unique identifier for every employee. Because some 
employees may not have a record in the 'EmployeeUNI' table, we must use a 
LEFT JOIN to preserve all records from the 'Employees' table. 
An INNER JOIN would incorrectly filter out any employees missing a unique ID.
*/

SELECT
    EU.unique_id,
    E.name
FROM Employees AS E
LEFT JOIN EmployeeUNI AS EU
  ON E.id = EU.id;
