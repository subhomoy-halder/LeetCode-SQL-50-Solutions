/* PROBLEM: 1667. Fix Names in a Table
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause

LOGIC:
The objective is to standardize user names so only the first character is 
uppercase and the rest are lowercase. We achieve this by splitting the string:
1. UPPER(LEFT(name, 1)) isolates and capitalizes the first letter.
2. LOWER(SUBSTRING(name FROM 2)) isolates and lowercases everything from the 
   second character onwards.

ARCHITECTURAL NOTE: 
1. PostgreSQL Concatenation: Unlike MS SQL Server which uses '+', PostgreSQL 
   standardizes on '||' for string concatenation. This is more portable and 
   prevents unexpected behavior with numeric types.
2. String Manipulation Performance: Using LEFT and SUBSTRING is more 
   performant than complex Regex patterns for simple capitalization tasks. 
   The database engine can execute these scalar functions in a single 
   linear pass.
3. Handling Edge Cases: The 'SUBSTRING(name FROM 2)' syntax is robust; if a 
   name is only one character long, it returns an empty string rather than 
   an error, allowing the concatenation to complete successfully.
*/

SELECT
    user_id,
    UPPER(LEFT(name, 1)) || LOWER(SUBSTRING(name FROM 2)) AS name
FROM users
ORDER BY user_id;
