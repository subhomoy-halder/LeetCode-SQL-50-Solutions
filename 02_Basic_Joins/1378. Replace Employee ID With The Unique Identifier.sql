/* PROBLEM: 1378. Replace Employee ID With The Unique Identifier
DIFFICULTY: Easy
TOPIC: Basic Joins & Handling NULLs

LOGIC:
The objective is to display a unique identifier for every employee. Because some 
employees may not have a record in the 'EmployeeUNI' table, we must use a 
LEFT JOIN to preserve all records from the 'Employees' table. 
An INNER JOIN would incorrectly filter out any employees missing a unique ID.

ARCHITECTURAL NOTE: 
1. Join Selection: A LEFT OUTER JOIN ensures data integrity for the primary 
   entity (Employees). In a reporting context, preserving the "Left" side of 
   the relationship is crucial when the "Right" side is optional.
2. Performance & Indexes: The 'id' column is the primary key for 'Employees' 
   and part of the primary key for 'EmployeeUNI'. The database engine can 
   perform a highly efficient "Nested Loop Join" or "Hash Join" using these 
   indexed columns.
3. Execution Order: The engine first identifies all rows in 'Employees' and 
   then probes 'EmployeeUNI' for matches, filling in NULLs where no match 
   exists.
*/

SELECT
    EU.unique_id,
    E.name
FROM Employees AS E
LEFT JOIN EmployeeUNI AS EU
  ON E.id = EU.id;
