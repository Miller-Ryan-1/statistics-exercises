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
    MAX(DATEDIFF(IF(salaries.to_date > NOW(),
                NOW(),
                salaries.to_date),
            employees.hire_date) / 365) AS Tenure,
    COUNT(titles.title)
FROM
    employees
        JOIN
    salaries USING (emp_no)
        JOIN
    titles USING (emp_no)
    GROUP BY emp_no;
    

-- Wow, almost forgot about the dash dash aready.  This has been a weird time.
-- So columns should be emp_no, salary at each to_date - hire_date