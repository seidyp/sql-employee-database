-- Select the employee number, last name, first name, sex 
-- and salary of all employees, ordered by employee number
CREATE VIEW employee_salaries AS (
	SELECT
		"Employees"."emp_no", 
		"Employees"."last_name",
		"Employees"."first_name",
		"Employees"."sex",
		"Salaries"."salary"
	FROM
		"Employees"
	INNER JOIN "Salaries" ON
		"Employees"."emp_no" = "Salaries"."emp_no"
	ORDER BY
		"Employees"."emp_no"
);

SELECT * FROM employee_salaries;

-- Select the first name, last name, and hiring date for all employees hired in 1986 
SELECT
	"Employees"."last_name",
	"Employees"."first_name",
	"Employees"."hire_date"
FROM
	"Employees"
WHERE
	"Employees"."hire_date" BETWEEN '1986-01-01' AND '1987-01-01';

-- Select the department number, department name, employee number, last name, 
-- and first name of all managers of each department

CREATE VIEW department_managers AS (
	SELECT
		"Employees"."emp_no", 
		"Employees"."last_name",
		"Employees"."first_name",
		"Dept_Manager"."dept_no",
		"Departments"."dept_name"
	FROM
		"Employees"
	INNER JOIN "Dept_Manager" ON
		"Employees"."emp_no" = "Dept_Manager"."emp_no"
	INNER JOIN "Departments" ON
		"Dept_Manager"."dept_no" = "Departments"."dept_no"
);

SELECT * FROM department_managers;

-- Select the employee number, last name, first name, and department of 
-- each employee, ordered by employee number
CREATE VIEW department_employee_names AS(	
	SELECT
		"Employees"."emp_no", 
		"Employees"."last_name",
		"Employees"."first_name",
		"Dept_Employees"."dept_no",
		"Departments"."dept_name"
	FROM
		"Employees"
	INNER JOIN "Dept_Employees" ON
		"Employees"."emp_no" = "Dept_Employees"."emp_no"
	INNER JOIN "Departments" ON
		"Dept_Employees"."dept_no" = "Departments"."dept_no"
	ORDER BY
		"Employees"."emp_no"
);

SELECT * FROM department_employee_names;

-- Select first name, last name, birth date, and sex of all 
-- employees whose first name is "Hercules" and last name begins with a "B"
SELECT
	"Employees"."last_name",
	"Employees"."first_name",
	"Employees"."birth_date",
	"Employees"."sex"	
FROM
	"Employees"
WHERE
	"Employees"."first_name" = 'Hercules' AND "Employees"."last_name" LIKE 'B%';

-- Select employee number, last name, first name, and department 
-- name of all employees in the Sales department, ordered by employee number
SELECT
	"emp_no",
	"last_name",
	"first_name",
	"dept_name"
FROM
	department_employee_names
WHERE
	"dept_name" = 'Sales'
ORDER BY 
	"emp_no";
	
-- Select employee number, last name, first name, and department name 
-- of all employees in the 'Sales' OR the 'Development' department, ordered by employee number
SELECT
	"emp_no",
	"last_name",
	"first_name",
	"dept_name"
FROM
	department_employee_names
WHERE
	"dept_name" = 'Sales' OR "dept_name" = 'Development'
ORDER BY 
	"emp_no" DESC;

-- Count the number of employees, grouped by last name
SELECT 
	"Employees"."last_name",
	COUNT("Employees"."emp_no") AS total_employees
FROM
	"Employees"
GROUP BY
	"Employees"."last_name";
