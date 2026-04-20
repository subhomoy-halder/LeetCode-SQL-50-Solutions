/* PROBLEM: 1667. Fix Names in a Table
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause

LOGIC:
The objective is to standardize user names so only the first character is 
uppercase and the rest are lowercase. We achieve this by splitting the string:
1. UPPER(LEFT(name, 1)) isolates and capitalizes the first letter.
2. LOWER(SUBSTRING(name FROM 2)) isolates and lowercases everything from the 
   second character onwards.
*/

SELECT
    user_id,
    UPPER(LEFT(name, 1)) || LOWER(SUBSTRING(name FROM 2)) AS name
FROM users
ORDER BY user_id;
