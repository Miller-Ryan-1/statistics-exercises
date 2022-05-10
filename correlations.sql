-- Correlations Exercises

USE employees;

SELECT 
    employees.emp_no,
    salaries.salary,
    DATEDIFF(IF(salaries.to_date > NOW(),
                NOW(),
                salaries.to_date),
            employees.hire_date) / 365 AS Tenure
FROM
    employees
        JOIN
    salaries USING (emp_no)
        JOIN
    titles USING (emp_no);

SELECT 
    employees.emp_no,
    MAX(DATEDIFF(IF(titles.to_date > NOW(),
                NOW(),
                titles.to_date),
            employees.hire_date) / 365) AS Tenure,
    COUNT(titles.title) AS Titles
FROM
    employees
        JOIN
    salaries USING (emp_no)
        JOIN
    titles USING (emp_no)
    GROUP BY emp_no;

-- Chi-squared exercise #3a
SELECT 
    departments.dept_name, dept_emp.emp_no, employees.gender
FROM
    departments
        JOIN
    dept_emp USING (dept_no)
        JOIN
    employees USING (emp_no)
WHERE
    dept_emp.to_date < NOW();
    
SELECT dept_name FROM departments;

-- Chi squared exercise 3b
SELECT 
    employees.gender, COUNT(employees.gender) AS count
FROM
    employees
        JOIN
    dept_manager USING (emp_no)
GROUP BY employees.gender;