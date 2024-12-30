SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id;
-- 2
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 3000;
-- 3
SELECT DISTINCT position
FROM employees;
-- 4
SELECT *
FROM employees
LIMIT 3 OFFSET 2;
-- 5
SELECT *
FROM employees
WHERE name LIKE '%Nguyễn%';
-- 6
SELECT SUM(salary) AS total_salary, AVG(salary) AS average_salary
FROM employees;
-- 7
SELECT e.name, d.department_name
FROM employees e
         INNER JOIN departments d ON e.department_id = d.department_id;
-- 8
SELECT d.department_name, e.name
FROM departments d
         LEFT JOIN employees e ON d.department_id = e.department_id;
-- 9
SELECT e.name, d.department_name
FROM employees e
         RIGHT JOIN departments d ON e.department_id = d.department_id;
-- 10
SELECT e1.name AS employee1, e2.name AS employee2, e1.salary
FROM employees e1
         JOIN employees e2 ON e1.salary = e2.salary AND e1.employee_id != e2.employee_id;
-- 11
SELECT department_id, COUNT(*) AS num_employees, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY num_employees DESC
LIMIT 1;
-- 12
SELECT e1.*
FROM employees e1
WHERE e1.salary = (
    SELECT MAX(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);
-- 13
SELECT position, AVG(salary) AS avg_salary
FROM employees
GROUP BY position
HAVING AVG(salary) > 1500;
-- 14
SELECT e1.name AS employee, e2.name AS colleague
FROM employees e1
         JOIN employees e2 ON e1.department_id = e2.department_id AND e1.employee_id != e2.employee_id;
-- 15
SELECT department_id, SUM(YEAR(CURDATE()) - YEAR(hire_date)) AS total_experience
FROM employees
GROUP BY department_id;
-- 16
SELECT e1.*
FROM employees e1
WHERE e1.hire_date = (
    SELECT MIN(e2.hire_date)
    FROM employees e2
    WHERE e2.department_id = e1.department_id
);
-- 17
SELECT e.name, e.salary, d.department_name
FROM employees e
         JOIN departments d ON e.department_id = d.department_id
WHERE d.department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY SUM(salary) DESC
    LIMIT 1
);
-- 18
SELECT
    CASE
        WHEN salary < 1500 THEN '< 1500'
        WHEN salary BETWEEN 1500 AND 2000 THEN '1500-2000'
        ELSE '> 2000'
        END AS salary_range,
    COUNT(*) AS num_employees
FROM employees
GROUP BY salary_range;
-- 19
SELECT e.name, d.department_name, e.salary
FROM employees e
         JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (SELECT MAX(salary) FROM employees);
-- 20
SELECT e.name, e.salary, d.department_name
FROM employees e
         JOIN departments d ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);









