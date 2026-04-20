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
*/

SELECT
    user_id,
    name,
    mail
FROM users
WHERE mail ~ '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$';
