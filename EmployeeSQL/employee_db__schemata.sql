-- list of all employees with personal data
CREATE TABLE "employees" (
    -- emp_no is the target value for titles, salaries,
    -- dept_emp, and dept_manager values
    "emp_no" int   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(50)   NOT NULL,
    "last_name" varchar(50)   NOT NULL,
    "gender" varchar(5)   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- title histories for each employee, without PK because employee titles may repeat
CREATE TABLE "titles" (
    -- has foreign key to the employees table
    "emp_no" int   NOT NULL,
    "title" varchar(50)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

-- salary histories for each employee, without PK because employee salaries may repeat
CREATE TABLE "salaries" (
    -- has foreign key to the employees table
    "emp_no" int   NOT NULL,
    "salary" money   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

-- list of all departments with name
CREATE TABLE "departments" (
    -- emp_no is the target value for
    -- dept_emp and dept_manager values
    "dept_no" varchar(10)   NOT NULL,
    "dept_name" varchar(50)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

-- department history for each employee, without PK because employee assignements may repeat
CREATE TABLE "dept_emp" (
    -- has foreign key to the employees table
    "emp_no" int   NOT NULL,
    -- has foreign key to the departments table
    "dept_no" varchar(10)   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

-- department history for each manager, without PK because manager assignements may repeat
CREATE TABLE "dept_manager" (
    -- has foreign key to the departments table
    "dept_no" varchar(10)   NOT NULL,
    -- has foreign key to the employees table
    "emp_no" int   NOT NULL,
    "from_date" date   NOT NULL,
    "to_date" date   NOT NULL
);

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

