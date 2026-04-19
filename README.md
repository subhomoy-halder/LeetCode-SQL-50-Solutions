# 🚀 LeetCode SQL 50: Advanced Solutions & Optimization

![LeetCode SQL Badge](https://img.shields.io/badge/LeetCode-SQL_50-FFA116?style=for-the-badge&logo=leetcode&logoColor=black)
![Progress](https://img.shields.io/badge/Progress-50%2F50-32CD32?style=for-the-badge)
![SQL Flavor](https://img.shields.io/badge/SQL_Flavor-PostgreSQL-blue?style=for-the-badge&logo=postgresql)

A curated collection of my solutions for the **LeetCode Top SQL 50** study plan. This repository demonstrates proficiency in solving real-world business logic problems using efficient SQL architecture.

## 🧠 Core Competencies Demonstrated
* **Window Functions:** Solving time-series and consecutive record problems with `OVER()`.
* **Recursive CTEs:** Handling hierarchical data structures.
* **Complex Joins:** Utilizing `SELF JOINs` and `CROSS APPLY` for non-linear data mapping.
* **Data Cleaning:** Regex patterns and advanced string manipulation.
* **Optimization:** Writing queries that minimize table scans and O(N) complexity.

---

## 📂 Repository Structure
Solutions are categorized by the core technical challenge they address:

- `01_Select/` - Basic data retrieval and filtering.
- `02_Basic_Joins/` - Relational mapping and multi-table queries.
- `03_Aggregate_Functions/` - Grouping, counting, and business metrics.
- `04_Sorting_and_Grouping/` - Result set organization.
- `05_Advanced_Select_Joins/` - High-level relational logic.
- `06_Subqueries/` - Nested logic for multi-step processing.
- `07_String_Functions_Regex/` - Unstructured data parsing.

---

## 📊 Solution Progress Tracker

| # | Problem Name | Difficulty | Category | Solution |
| :--- | :--- | :--- | :--- | :--- |
| 1757 | Recyclable and Low Fat Products | 🟢 Easy | Select | [View Script](./01_Select/1757.%20Recyclable%20and%20Low%20Fat%20Products.sql) |
| 584 | Find Customer Referee | 🟢 Easy | Select | [View Script](./01_Select/584.%20Find%20Customer%20Referee.sql) |
| 595 | Big Countries | 🟢 Easy | Select | [View Script](./01_Select/595.%20Big%20Countries.sql) |
| 1148 | Article Views I | 🟢 Easy | Select | [View Script](./01_Select/1148.%20Article%20Views%20I.sql) |
| 1683 | Invalid Tweets | 🟢 Easy | Select | [View Script](./01_Select/1683.%20Invalid%20Tweets.sql) |
| 1378 | Replace Employee ID With The Unique Identifier | 🟢 Easy | Basic Joins | [View Script](./02_Basic_Joins/1378.%20Replace%20Employee%20ID%20With%20The%20Unique%20Identifier.sql) |
| 1068 | Product Sales Analysis I | 🟢 Easy | Basic Joins | [View Script](./02_Basic_Joins/1068.%20Product%20Sales%20Analysis%20I.sql) |
| 1581 | Customer Who Visited but Did Not Make Any Transactions | 🟢 Easy | Basic Joins | [View Script](./02_Basic_Joins/1581.%20Customer%20Who%20Visited%20but%20Did%20Not%20Make%20Any%20Transactions.sql) |
| 197 | Rising Temperature | 🟢 Easy | Basic Joins | [View Script](./02_Basic_Joins/197.%20Rising%20Temperature.sql) |
| 1661 | Average Time of Process per Machine | 🟢 Easy | Basic Joins | [View Script](./02_Basic_Joins/1661.%20Average%20Time%20of%20Process%20per%20Machine.sql) |
| 577 | Employee Bonus | 🟢 Easy | Basic Joins | [View Script](./02_Basic_Joins/577.%20Employee%20Bonus.sql) |
| 1280 | Students and Examinations | 🟢 Easy | Basic Joins | [View Script](./02_Basic_Joins/1280.%20Students%20and%20Examinations.sql) |
| 570 | Managers with at Least 5 Direct Reports | 🟡 Medium | Basic Joins | [View Script](./02_Basic_Joins/570.%20Managers%20with%20at%20Least%205%20Direct%20Reports.sql) |
| 1934 | Confirmation Rate | 🟡 Medium | Basic Joins | [View Script](./02_Basic_Joins/1934.%20Confirmation%20Rate.sql) |
| 620 | Not Boring Movies | 🟢 Easy | Aggregate Functions | [View Script](./03_Aggregate_Functions/620.%20Not%20Boring%20Movies.sql) |
| 1251 | Average Selling Price | 🟢 Easy | Aggregate Functions | [View Script](./03_Aggregate_Functions/1251.%20Average%20Selling%20Price.sql) |
| 1075 | Project Employees I | 🟢 Easy | Aggregate Functions | [View Script](./03_Aggregate_Functions/1075.%20Project%20Employees%20I.sql) |
| 1633 | Percentage of Users Attended a Contest | 🟢 Easy | Aggregate Functions | [View Script](./03_Aggregate_Functions/1633.%20Percentage%20of%20Users%20Attended%20a%20Contest.sql) |
| 1211 | Queries Quality and Percentage | 🟢 Easy | Aggregate Functions | [View Script](./03_Aggregate_Functions/1211.%20Queries%20Quality%20and%20Percentage.sql) |
| 1193 | Monthly Transactions I | 🟡 Medium | Aggregate Functions | [View Script](./03_Aggregate_Functions/1193.%20Monthly%20Transactions%20I.sql) |
| 1174 | Immediate Food Delivery II | 🟡 Medium | Aggregate Functions | [View Script](./03_Aggregate_Functions/1174.%20Immediate%20Food%20Delivery%20II.sql) |
| 550 | Game Play Analysis IV | 🟡 Medium | Aggregate Functions | [View Script](./03_Aggregate_Functions/550.%20Game%20Play%20Analysis%20IV.sql) |
| 2356 | Number of Unique Subjects Taught by Each Teacher | 🟢 Easy | Sorting And Grouping | [View Script](./04_Sorting_And_Grouping/2356.%20Number%20of%20Unique%20Subjects%20Taught%20by%20Each%20Teacher.sql) |
| 1141 | User Activity for the Past 30 Days I | 🟢 Easy | Sorting And Grouping | [View Script](./04_Sorting_And_Grouping/1141.%20User%20Activity%20for%20the%20Past%2030%20Days%20I.sql) |
| 1070 | Product Sales Analysis III | 🟡 Medium | Sorting And Grouping | [View Script](./04_Sorting_And_Grouping/1070.%20Product%20Sales%20Analysis%20III.sql) |
| 596 | Classes With at Least 5 Students | 🟢 Easy | Sorting And Grouping | [View Script](./04_Sorting_And_Grouping/596.%20Classes%20With%20at%20Least%205%20Students.sql) |
| 1729 | Find Followers Count | 🟢 Easy | Sorting And Grouping | [View Script](./04_Sorting_And_Grouping/1729.%20Find%20Followers%20Count.sql) |
| 619 | Biggest Single Number | 🟢 Easy | Sorting And Grouping | [View Script](./04_Sorting_And_Grouping/619.%20Biggest%20Single%20Number.sql) |
| 1045 | Customers Who Bought All Products | 🟡 Medium | Sorting And Grouping | [View Script](./04_Sorting_And_Grouping/1045.%20Customers%20Who%20Bought%20All%20Products.sql) |
| 610 | Triangle Judgement | 🟢 Easy | Advanced Select And Joins | [View Script](./05_Advanced_Select_And_Joins/610.%20Triangle%20Judgement.sql) |
| 1731 | The Number of Employees Which Report to Each Employee | 🟢 Easy | Advanced Select And Joins | [View Script](./05_Advanced_Select_And_Joins/1731.%20The%20Number%20of%20Employees%20Which%20Report%20to%20Each%20Employee.sql) |
| 1789 | Primary Department for Each Employee | 🟢 Easy | Advanced Select And Joins | [View Script](./05_Advanced_Select_And_Joins/1789.%20Primary%20Department%20for%20Each%20Employee.sql) |
| 1907 | Count Salary Categories | 🟡 Medium | Advanced Select And Joins | [View Script](./05_Advanced_Select_And_Joins/1907.%20Count%20Salary%20Categories.sql) |
| 180 | Consecutive Numbers | 🟡 Medium | Advanced Select And Joins | [View Script](./05_Advanced_Select_And_Joins/180.%20Consecutive%20Numbers.sql) |
| 1164 | Product Price at a Given Date | 🟡 Medium | Advanced Select And Joins | [View Script](./05_Advanced_Select_And_Joins/1164.%20Product%20Price%20at%20a%20Given%20Date.sql) |
| 1204 | Last Person to Fit in the Bus | 🟡 Medium | Advanced Select And Joins | [View Script](./05_Advanced_Select_And_Joins/1204.%20Last%20Person%20to%20Fit%20in%20the%20Bus.sql) |
| 1321 | Restaurant Growth | 🟡 Medium | Subqueries | [View Script](./06_Subqueries/1321.%20Restaurant%20Growth.sql) |
| 1341 | Movie Rating | 🟡 Medium | Subqueries | [View Script](./06_Subqueries/1341.%20Movie%20Rating.sql) |
| 185 | Department Top Three Salaries | 🔴 Hard | Subqueries | [View Script](./06_Subqueries/185.%20Department%20Top%20Three%20Salaries.sql) |
| 1978 | Employees Whose Manager Left the Company | 🟢 Easy | Subqueries | [View Script](./06_Subqueries/1978.%20Employees%20Whose%20Manager%20Left%20the%20Company.sql) |
| 585 | Investments in 2016 | 🟡 Medium | Subqueries | [View Script](./06_Subqueries/585.%20Investments%20in%202016.sql) |
| 602 | Friend Requests II: Who Has the Most Friends | 🟡 Medium | Subqueries | [View Script](./06_Subqueries/602.%20Friend%20Requests%20II:%20Who%20Has%20the%20Most%20Friends.sql) |
| 626 | Exchange Seats | 🟡 Medium | Subqueries | [View Script](./06_Subqueries/626.%20Exchange%20Seats.sql) |
| 1327 | List the Products Ordered in a Period | 🟢 Easy | Advanced String Functions / Regex / Clause | [View Script](./07_Advanced_String_Functions_Regex_Clause/1327.%20List%20the%20Products%20Ordered%20in%20a%20Period.sql) |
| 1484 | Group Sold Products By The Date | 🟢 Easy | Advanced String Functions / Regex / Clause | [View Script](./07_Advanced_String_Functions_Regex_Clause/1484.%20Group%20Sold%20Products%20By%20The%20Date.sql) |
| 1517 | Find Users With Valid E-Mails | 🟢 Easy | Advanced String Functions / Regex / Clause | [View Script](./07_Advanced_String_Functions_Regex_Clause/1517.%20Find%20Users%20With%20Valid%20E-Mails.sql) |
| 1527 | Patients With a Condition | 🟢 Easy | Advanced String Functions / Regex / Clause | [View Script](./07_Advanced_String_Functions_Regex_Clause/1527.%20Patients%20With%20a%20Condition.sql) |
| 1667 | Fix Names in a Table | 🟢 Easy | Advanced String Functions / Regex / Clause | [View Script](./07_Advanced_String_Functions_Regex_Clause/1667.%20Fix%20Names%20in%20a%20Table.sql) |
| 176 | Second Highest Salary | 🟡 Medium | Advanced String Functions / Regex / Clause | [View Script](./07_Advanced_String_Functions_Regex_Clause/176.%20Second%20Highest%20Salary.sql) |
| 196 | Delete Duplicate Emails | 🟢 Easy | Advanced String Functions / Regex / Clause | [View Script](./07_Advanced_String_Functions_Regex_Clause/196.%20Delete%20Duplicate%20Emails.sql) |

---

## 🛠️ How to Use
1. **Explore:** Browse by category folder to see specific logic implementations.
2. **Review:** Each `.sql` file contains the problem link and a brief explanation of the optimization used.

---

