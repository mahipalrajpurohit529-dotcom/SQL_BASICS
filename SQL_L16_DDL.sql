
-- DDL ==> DATA DEFINATION LANGUAGE
	-- CREATE, DROP, TRUNCATE, ALTER

use regex;

-- 1.CREATE :-

	-- way to make a table :- 
create table raj1(col int);

	-- another way using an already existing table
	-- create table using select(CTUS)
create table actor_cp as select first_name,last_name from sakila.actor;

-- but what if we want to give alias to these selected columns 
create table actor_cp2 as select first_name as fn,last_name as ln from sakila.actor;

	-- we can also add filters here
    -- we can use any select statment and method here to create a table
    -- In DQL we quary it 
    -- but in DDL (CTUS) we send that quary to a new table 



-- 2. DROP:-

-- used to delete the already existing table
-- it deletes the table and its data 

drop table actor_cp;



-- 3. ALTER :- 
	-- it is the most important one 
    -- it allows to make changes to an already existing table 
    -- whatever we want to do with the table structure it will be done with the help of alter


create table actor_cp3 as select first_name as fn,last_name as ln from sakila.actor where actor_id between 10 and 14;

alter table actor_cp3 add column (salary int);		-- way to add column
alter table actor_cp3 add constraint new_key primary key (fn);		-- added a constraint as new_key
alter table actor_cp3 rename column salary to new_salary; 			-- renamed a column using alter 






-- 4. TRUNCATE :-
		--





select * from actor_cp3;





-- DML(Data Manupilation Language) :-
	-- INSERT  --> we already know how to use it
    -- UPDATE

update actor_cp3 set new_salary = 900;  
			-- show warning for safe mode on

-- to make it work we have to change the preferences and turn off safe mode
-- edit --> preferences --> sql editor --> untick the safe update 

update actor_cp3 set new_salary = 900;  
	-- this will change all the salary to 900
    -- so we need to use conditions when doing it

update actor_cp3 set new_salary = 800 where fn = 'UMA';  

