-- Find all employees 
SELECT * FROM employee;

-- Find all clients
SELECT * FROM client;

-- Find all employees orderd by salaries
SELECT * FROM employee
ORDER BY salary DESC;

-- Find all employees orderd by sex and then by name
SELECT * FROM employee
ORDER BY sex,first_name,las_name;

-- Find first 5 employees in the table
SELECT * FROM employee
LIMIT 5;

-- Find the first and last name of all employees
SELECT first_name, las_name FROM employee;

-- Find the forenames and surenames of all employees
SELECT first_name AS forename,
las_name AS surename
FROM employee;

-- Find out all the different genders
SELECT DISTINCT(sex) FROM employee;

-- function count the number of employees
SELECT COUNT(emp_id)
FROM employee;

-- find the number of female employees born after 1970
SELECT COUNT(emp_id)
FROM employee
WHERE sex='F' AND birth_date > '1970-01-01';

-- find the average of all employees salaries
SELECT AVG(salary)
FROM employee;

-- find the sum salaries of all employee
SELECT SUM(salary)
FROM employee;

-- find out how many males and females there are
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

-- find total sales of each salesman
SELECT * FROM works_with;
SELECT emp_id, SUM(total_sales), COUNT(total_sales)
FROM works_with
GROUP BY emp_id;

-- find the totals sent by each client
SELECT client_id, SUM(total_sales)
FROM works_with
GROUP BY client_id;

-- find the clients who are an LLC
SELECT * FROM client
WHERE client_name LIKE '%LLC';

-- find any branch supplier who are in the label business
SELECT * FROM branch_supplier
WHERE supplier_name LIKE '% Label%';

-- find any employee born in october
SELECT * FROM employee
WHERE birth_date LIKE '____-10%';

-- find any clients who are schools
SELECT * FROM client
WHERE client_name LIKE '%school%';

-- Join
-- find a list of employee and branch names
SELECT e.first_name, e.las_name, b.branch_name
FROM employee as e
JOIN branch as b
ON e.branch_id = b.branch_id;

-- find a list of branches and thier managers
SELECT e.emp_id, e.first_name, b.branch_name
FROM employee as e
JOIN branch as b
ON e.emp_id = b.mgr_id;

--  (LEFT JOIN)
SELECT e.emp_id, e.first_name, b.branch_name
FROM employee as e
LEFT JOIN branch as b
ON e.emp_id = b.mgr_id;

-- (Right Join)
SELECT e.emp_id, e.first_name, b.branch_name
FROM employee as e
RIGHT JOIN branch as b
ON e.emp_id = b.mgr_id;

-- (Inner Join)
SELECT e.emp_id, e.first_name, b.branch_name
FROM employee as e
INNER JOIN branch as b
ON e.emp_id = b.mgr_id;

-- nested queries

-- find name of all employees who have
-- sold over 30,000 to a single client
SELECT first_name, las_name
FROM employee
WHERE employee.emp_id IN (
SELECT emp_id 
FROM works_with
WHERE total_sales > 30000
);

-- find all clients who are handled by the branch that michal scott manager
-- Assume you have the michals ID
SELECT client_name
FROM client
WHERE branch_id IN (
SELECT branch_id 
FROM branch
WHERE mgr_id=102
);













