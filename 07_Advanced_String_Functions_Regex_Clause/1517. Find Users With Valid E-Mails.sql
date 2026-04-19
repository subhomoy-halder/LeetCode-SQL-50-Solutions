/* PROBLEM: 1517. Find Users With Valid E-Mails
DIFFICULTY: Easy
TOPIC: Advanced String Functions, Regex, And Clause

LOGIC:
The objective is to identify users with valid emails based on three criteria:
1. Starts with a letter.
2. Contains only valid characters (letters, digits, underscores, periods, or dashes).
3. Ends strictly with the '@leetcode.com' domain.
We utilize the PostgreSQL regex operator '~' to validate the entire string in 
a single logical pass.

ARCHITECTURAL NOTE: 
1. POSIX Regular Expressions: Unlike standard 'LIKE' patterns, the '~' operator 
   allows for complex sequence detection. The pattern '^[a-zA-Z][a-zA-Z0-9_.-]*' 
   ensures the first character is a letter and all subsequent characters 
   belong to the approved set.
2. Escaping Special Characters: We use '\.' before 'com' because a period is a 
   reserved wildcard in regex. Escaping it ensures we are matching a literal 
   dot rather than "any character."
3. Boundary Anchors: The '^' (start) and '$' (end) anchors are critical. They 
   prevent the query from matching valid patterns that are buried inside a 
   longer, invalid string.
*/

SELECT
    user_id,
    name,
    mail
FROM users
WHERE mail ~ '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$';
