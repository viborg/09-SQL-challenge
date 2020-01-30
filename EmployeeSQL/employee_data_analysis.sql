-- 1. List the following details of each employee: employee number, last
-- name, first name, gender, and salary.
select employees.emp_no, 
	last_name,
	first_name,
	gender,
	salaries.salary
from employees
join salaries ON
	employees.emp_no = salaries.emp_no;

select date_part('year', hire_date) from employees

-- 2. List employees who were hired in 1986.
select emp_no, last_name, first_name, hire_date
from employees
where date_part('year', hire_date) = 1986;

-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.
select d.dept_no,d.dept_name, 
	dm.emp_no, e.last_name, 
	e.first_name, dm.from_date, dm.to_date
from departments as d
join dept_manager as dm ON
	d.dept_no = dm.dept_no
join employees as e ON
	dm.emp_no = e.emp_no;

-- 4. List the department of each employee with the following information:
-- employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de ON
	e.emp_no = de.emp_no
join departments as d ON
	de.dept_no = d.dept_no
order by e.emp_no;
	
-- 5. List all employees whose first name is "Hercules" and last names
-- begin with "B."
select first_name, last_name
from employees
where first_name LIKE 'Hercules' AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee
-- number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de ON
	e.emp_no = de.emp_no
join departments as d ON
	de.dept_no = d.dept_no
where d.dept_name LIKE 'Sales';

-- 7. List all employees in the Sales and Development departments,
-- including their employee number, last name, first name, and 
-- department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
join dept_emp as de ON
	e.emp_no = de.emp_no
join departments as d ON
	de.dept_no = d.dept_no
where d.dept_name LIKE 'Sales' OR d.dept_name LIKE 'Development';

-- 8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
select last_name, count(last_name)
from employees
group by last_name
order by count(last_name) DESC;
