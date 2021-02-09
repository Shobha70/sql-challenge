-- Delete the table "employees"
DROP TABLE employees;

-- Re-create the table "employees"
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(30) NOT NULL,
  birth_date DATE,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  sex VARCHAR(1),	
  hire_date DATE
);


-- Delete the table "departments"
DROP TABLE departments;

-- Re-create the table "departments"
CREATE TABLE departments (
  dept_no VARCHAR(30) PRIMARY KEY,
  dept_name VARCHAR(30) NOT NULL
);


-- Delete the table "dept_emp"
DROP TABLE dept_emp;

-- Re-create the table "dept_emp"
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(30) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  PRIMARY KEY (emp_no,dept_no)	
);


-- Delete the table "dept_manager"
DROP TABLE dept_manager;

-- Re-create the table "dept_manager"
CREATE TABLE dept_manager (
  dept_no VARCHAR(30) NOT NULL,
  emp_no INT NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (dept_no,emp_no)	
);


-- Delete the table "salaries"
DROP TABLE salaries;

-- Re-create the table "salaries"
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  PRIMARY KEY (emp_no,salary)	
);



-- Delete the table "titles"
DROP TABLE titles;

-- Re-create the table "titles"
CREATE TABLE titles (
  title_id VARCHAR(30) PRIMARY KEY,
  title VARCHAR(30)
);


-- Add foreign key constraint to employees table
ALTER TABLE employees
ADD CONSTRAINT fk_emp_title FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);