
use regex;




-- constraints in sql :-
	-- rules that we apply to limit the data in the table
    -- it is a set of rules that protect our data 
    -- we use it to maintain the accuracy and reliablity of the data 
    
-- types of constraints :- 
		-- 1. not null
        -- 2. Unique
        -- 3. Primary key
        -- 4. Foreign Key
        -- 5. Check
        -- 6. Defult
        


        

-- how to create a table :- 

-- using DDL (creat,alter,drop,truncate)
create table test1(Serial_no int);


-- DML (insert,update,delete,merge)
insert into test1 values(10);
insert into test1(Serial_no) values (20);
insert into test1(Serial_no) values (null),(20);

			-- here we can add null values 
            -- but we dont want null numbers to be here 
            

create table test2(sno int not null, salary int);						-- NOT NULL
insert into test2 (sno) values(20);
insert into test2 (sno,salary) values(20,1000);
insert into test2 (sno,salary) values(22,null);
	
    -- we can add null to the salary here because we didnt constrained it
    -- but we cant add null to the sno as we constrained it 

insert into test2 (sno,salary) values(null,1000);

    

create table test3(sno int not null default 80, salary int);				-- DEFAULT
insert into test3(salary) values(1000);		-- if no value is given then sno takes the default value to itself
insert into test3(sno) values(5900);
select * from test3;





create table test4(sno int not null ,salary int unique default 100);				-- UNIQUE

insert into test4(salary) values(1000); -- error as not null constrained on sno with no default
insert into test4(sno,salary) values(12,1000);	-- works just fine
insert into test4(sno,salary) values(14,1000);	-- error because salary should be unique because it is constrained 
insert into test4(sno) values(1000);		-- works fine because it gives salary 100 by default
insert into test4(sno) values(1000);     	-- shows error as salary get 100 by default which wont be unique this time
select * from test4;

-- also remember that even if we constrained the salary for unique , it can have null values
-- you might think it cant have multiple values but in truth it can have as many null values as we want
-- because null values dont take memory so the unique constraint doesnt affect them




create table test5(sno int ,salary int, check (sno between 1 and 100),check (salary in (1000,2000)));				-- CHECK
insert into test5(sno,salary) values(4,1000);		-- works fine
insert into test5(sno,salary) values(4,1500);		-- error
insert into test5(sno,salary) values(134,2000);		-- error



-- this is fine and shows check constraint voilated 
-- but if we had 1000 lines and created multiple checks we wont know whic check constraint is voilated 
-- so its best to use allias for the check constraints




create table test7(sno int,salary int,
constraint sno_const check (sno < 100),
constraint salary_cons check (salary in (1000,2000)));

insert into test7(sno,salary) values(4,1000);		-- works fine
insert into test7(sno,salary) values(4,1500);		-- error with constrait name 
insert into test7(sno,salary) values(134,2000);		-- error with constraint name






create table test8(sno int primary key,salary int );   				-- PRIMARY KEY
		-- primary key just applies two constraints together 
        -- not null and unique 






create table customer1(Cid int primary key , cname varchar(20));
insert into customer1 values (10,'aman'),(11,'abhishek');



create table order1 (order_no int primary key, city varchar (20),cid int,
foreign key (cid) references customer1(cid) );					-- FOREIGN KEY
insert into order1 values (1007,'jaipur',10),(1008,'delhi',11),(1009,'mumbai',10);
insert into order1 values (10010,'jaipur',25);

select * from customer1;



























