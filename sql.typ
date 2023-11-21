# SQL Concepts Practice
*:SQL_CONCEPTS
B:SQL Concepts
T:In this lesson, we'll practice typing SQL statements with explanations of their purpose.

I:(1) Warm up
D:The quick brown fox jumps over the lazy dog.
 :sql is a powerful language used for managing and querying relational databases.

I:(2) Basic SELECT statement
S:# Retrieve all columns from the 'employees' table
 :select * from employees;

I:(3) Filtering with WHERE
S:# Retrieve employees with a salary greater than 50000
 :select * from employees where salary > 50000;

I:(4) Ordering with ORDER BY
S:# Retrieve employees, ordered by their hire date in ascending order
 :select * from employees order by hire_date asc;

I:(5) Using GROUP BY
S:# Count the number of employees in each department
 :select department_id, count(*) from employees group by department_id;

I:(6) Filtering GROUP BY results with HAVING
S:# Retrieve departments with more than 5 employees
 :select department_id, count(*) from employees group by department_id having count(*) > 5;

I:(7) INNER JOIN
S:# Retrieve employees and their corresponding departments
 :select employees.employee_id, employees.employee_name, departments.department_name
 :from employees
 :join departments on employees.department_id = departments.department_id;

I:(8) LEFT JOIN
S:# Retrieve all employees and their departments, including those without a department
 :select employees.employee_id, employees.employee_name, departments.department_name
 :from employees
 :left join departments on employees.department_id = departments.department_id;

I:(9) Using subqueries
S:# Retrieve employees who have a salary greater than the average salary
 :select * from employees where salary > (select avg(salary) from employees);

I:(10) Using Common Table Expressions (CTE)
S:# Retrieve employees and their managers using a recursive common table expression
 :with employee_hierarchy as (
 :    select employee_id, employee_name, manager_id
 :    from employees
 :    where manager_id is null
 :    union all
 :    select e.employee_id, e.employee_name, e.manager_id
 :    from employees e
 :    join employee_hierarchy eh on e.manager_id = eh.employee_id
 :)
 :select * from employee_hierarchy;

I:(11) Using EXISTS
S:# Retrieve employees who have attended at least one training session
 :select * from employees e where exists (
 :    select 1 from training_sessions t
 :    where e.employee_id = t.employee_id
 :);

I:(12) Using CASE statements
S:# Classify employees into 'Junior' and 'Senior' based on their experience
 :select employee_name,
 :    case
 :        when years_of_experience < 3 then 'Junior'
 :        else 'Senior'
 :    end as employee_class
 :from employees;

Q:Do you want to continue to the next lesson [Y/N] ?
N:MENU

# Advanced SQL Practice
*:ADVANCED_SQL
B:Advanced SQL Concepts
T:In this lesson, we'll explore more advanced SQL features and statements.

I:(1) Subqueries in WHERE clause
S:# Retrieve employees who work in a department with more than 2 employees
 :select * from employees where department_id in (
 :    select department_id from employees group by department_id having count(*) > 2
 :);

I:(2) Self JOIN
S:# Retrieve employees and their managers
 :select e.employee_name, m.employee_name as manager_name
 :from employees e
 :join employees m on e.manager_id = m.employee_id;

I:(3) Window Functions
S:# Calculate the average salary over departments using window function
 :select department_id, employee_name, salary,
 :    avg(salary) over (partition by department_id) as avg_department_salary
 :from employees;

I:(4) Pivot and Unpivot
S:# Pivot the 'training_sessions' table to show attendance by employee
 :select *
 :from (
 :    select employee_id, session_name, attendance_status
 :    from training_sessions
 :) pivot (
 :    max(attendance_status)
 :    for session_name in ('Session1' as s1, 'Session2' as s2, 'Session3' as s3)
 :);

I:(5) Common Table Expressions (CTE) with DELETE
S:# Delete employees who have been inactive for more than 6 months
 :with inactive_employees as (
 :    select employee_id
 :    from employees
 :    where last_activity_date < current_date - interval '6' month
 :)
 :delete from employees where employee_id in (select employee_id from inactive_employees);

I:(6) MERGE Statement
S:# Update or insert employees based on their employee_id
 :merge into employees target
 :using (
 :    select employee_id, employee_name, salary
 :    from temp_employees
 :) source
 :on (target.employee_id = source.employee_id)
 :when matched then update set target.employee_name = source.employee_name, target.salary = source.salary
 :when not matched then insert (employee_id, employee_name, salary) values (source.employee_id, source.employee_name, source.salary);

Q:Do you want to continue to the next lesson [Y/N] ?
N:MENU
