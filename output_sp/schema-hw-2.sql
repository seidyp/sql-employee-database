-- Exported from quickdatabasediagrams, edits and changes made 
-- Dropping tables if existing
DROP TABLE IF EXISTS "Titles";
DROP TABLE IF EXISTS "Employees";
DROP TABLE IF EXISTS "Departments";
DROP TABLE IF EXISTS "Dept_Manager" CASCADE;
DROP TABLE IF EXISTS "Dept_Employees";
DROP TABLE IF EXISTS "Salaries";
-- -- Determine the relations
-- -- replace /relationship/ with the type of relationship to corresponding table

CREATE TABLE "Employees" (
    "emp_no" INTEGER   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "Salaries" (
    "emp_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
    CONSTRAINT "pk_Salaries" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "Dept_Manager" (
	"dept_no" VARCHAR   NOT NULL,
    "emp_no" INTEGER   NOT NULL,
    CONSTRAINT "pk_Dept_Manager" PRIMARY KEY (
        "dept_no","emp_no"
     )
);

CREATE TABLE "Dept_Employees" (
    "emp_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Dept_Employees" PRIMARY KEY (
        "emp_no", "dept_no"
     )
);

CREATE TABLE "Departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "dept_no"
     )
);

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "Titles" ("title_id");

ALTER TABLE "Salaries" ADD CONSTRAINT "fk_Salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Manager" ADD CONSTRAINT "fk_Dept_Manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Departments" ("dept_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_emp_no" FOREIGN KEY("emp_no")
REFERENCES "Employees" ("emp_no");

ALTER TABLE "Dept_Employees" ADD CONSTRAINT "fk_Dept_Employees_dept_no" FOREIGN KEY("dept_no")
REFERENCES "Dept_Manager" ("dept_no");