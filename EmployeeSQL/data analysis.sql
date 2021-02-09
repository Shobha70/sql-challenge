--Data Analysis

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select e.emp_no "employee number", 
       e.last_name "last name", 
	   e.first_name "first name", 
	   e.sex, 
	   s.salary
from employees e,
     salaries s
where e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
select first_name,
       last_name,
	   hire_date
from employees
where hire_date >= '01-JAN-1986' AND hire_date <= '31-DEC-1986'; 	   

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select dm.dept_no,
       d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name
from
dept_manager dm,
departments d,
employees e
where dm.dept_no = d.dept_no
and dm.emp_no = e.emp_no;

4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select e.emp_no,       
	   e.last_name,
	   e.first_name,
	   d.dept_name
from
dept_emp de,
departments d,
employees e
where de.dept_no = d.dept_no
and de.emp_no = e.emp_no
order by e.emp_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select first_name,
       last_name,
	   sex
from
employees
where first_name = 'Hercules'
and last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e,
     dept_emp de,
	 departments d
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and d.dept_name = 'Sales';


--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees e,
     dept_emp de,
	 departments d
where e.emp_no = de.emp_no
and de.dept_no = d.dept_no
and d.dept_name in ('Sales','Development');


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(*)
from employees
group by last_name
order by last_name desc;