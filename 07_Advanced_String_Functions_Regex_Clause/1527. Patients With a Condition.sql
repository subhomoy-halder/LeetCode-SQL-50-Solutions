/* PROBLEM: 1527. Patients With a Condition
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause
 
LOGIC:
The objective is to identify patients who have Type I Diabetes. The problem 
specifies that Type I Diabetes codes always start with the 'DIAB1' prefix. 
Since a patient can have multiple conditions separated by spaces, we check for 
two scenarios:
1. 'DIAB1%' - The code is the very first entry in the conditions string.
2. '% DIAB1%' - The code appears later in the string, preceded by a space.
*/

SELECT
    patient_id,
    patient_name,
    conditions
FROM patients
WHERE conditions LIKE 'DIAB1%' 
   OR conditions LIKE '% DIAB1%';
