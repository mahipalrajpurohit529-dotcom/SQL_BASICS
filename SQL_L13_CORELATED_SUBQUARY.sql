-- CORELATED SUBQUARY

-- co related quary is quary that depends on outer quary for execution
-- it runs many times
-- the inner quary relies on the outer quary 


-- since it runs solo for every row , it is very slow 
-- therefor we dont use it much in real life
-- we use something called CTR in place of corelated subquary




use regex;

CREATE TABLE emp (
    eid INT PRIMARY KEY,
    ename VARCHAR(50),
    salary INT,
    department_name VARCHAR(50)
);

INSERT INTO emp (eid, ename, salary, department_name) VALUES
(1,  'Emp1',  30000, 'HR'),
(2,  'Emp2',  32000, 'HR'),
(3,  'Emp3',  34000, 'HR'),
(4,  'Emp4',  36000, 'HR'),
(5,  'Emp5',  38000, 'HR'),

(6,  'Emp6',  50000, 'IT'),
(7,  'Emp7',  52000, 'IT'),
(8,  'Emp8',  54000, 'IT'),
(9,  'Emp9',  56000, 'IT'),
(10, 'Emp10', 58000, 'IT'),

(11, 'Emp11', 60000, 'Finance'),
(12, 'Emp12', 62000, 'Finance'),
(13, 'Emp13', 64000, 'Finance'),
(14, 'Emp14', 66000, 'Finance'),
(15, 'Emp15', 68000, 'Finance'),

(16, 'Emp16', 40000, 'Sales'),
(17, 'Emp17', 42000, 'Sales'),
(18, 'Emp18', 44000, 'Sales'),
(19, 'Emp19', 46000, 'Sales'),
(20, 'Emp20', 48000, 'Sales');







select * from emp;

-- find the details of the employees who have salary higher than the avg salary of their department
select * from emp as empo where empo.salary > (select avg(Salary) from emp where emp.department_name = empo.department_name);

-- find the emp who has the lowest salary in each department
select * from emp as empo where empo.salary = (select min(Salary) from emp where emp.department_name = empo.department_name);








-- CTE :-
	-- commen table expresion
    -- syntax to create :- 

with xyz as 
(select department_name ,avg(salary) as salary from emp group by department_name)
		-- we dont end it with semi collon
        -- we can excess abs as a table as long as we dont end our next quaries with semi collon
        
select * from emp join xyz on emp.department_name = xyz.department_name where emp.salary > xyz.salary;



