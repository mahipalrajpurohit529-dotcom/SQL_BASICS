 -- TCL
 -- Transection control language which is used to handle the logical statement
 -- transection is set of logically related statement (not permanent)
 -- used to maintain the data consistancy 
 -- when you start the transection you all work after that will be logical and wont be saved until we close the transection
 
 
 
 use regex;
create table actor_cpo as select actor_id ,first_name from sakila.actor where actor_id between 1 and 5; 
select * from actor_cpo;

-- if we had multiple connection and did some changes in a table of a database in one connection then 
-- open the second connection and check on that table 
-- then weather or not those changes will reflect depends on TCL
-- this is how TCL controls it

-- by default in MySQL it will reflect 
-- that is because the autocommit is enabled in it by default
-- we can change it by setting @@autocommit = 0

set @@autocommit = 0;
set @@autocommit = 1;



-- transections :-

	-- when will it start ?
    -- is case if you run any DML operation with auto commit off your transection starts
    -- or you write down start transection(using starttransection keyword) then your transection starts
    
    -- when will it end ?
    -- When you run a TCL statement like commit or rollback 
    -- or in case you run any DDL or DCL operation it will still close the transections



-- we run rollback and commit like :- 
rollback;
commit;

-- remember that if you have a pending transection and then you commit it , it will be saved 
-- and if you try to run the rollback now , then it wont rollback anything 
-- AND VICE VERCA




start transaction;
insert into actor_cpo values (12,'amazon');
commit;

start transaction;
insert into actor_cpo values (13,'flipcart');
rollback;


start transaction;
insert into actor_cpo values (14,'me');
create table xyz(id int);		-- ending transaction with ddl 



start transaction;
insert into actor_cpo values (15,'you');
insert into actor_cpo values (16,'he');
delete from actor_cpo where actor_id in (2,3,4);
commit;
select * from actor_cpo;



start transaction;
insert into actor_cpo values (17,'she');
insert into actor_cpo values (18,'her');
delete from actor_cpo where actor_id = 1;
rollback;
select * from actor_cpo;





-- but it will rollback or commit all the logics of the transection 
-- what if we only want selected parts to be commited or reollbacked




start transaction;
insert into actor_cpo values (19,'they');
insert into actor_cpo values (20,'them');
savepoint first;
delete from actor_cpo where actor_id = 15;
rollback to first;
commit;
select * from actor_cpo;


-- the rollback to first would just rollback to the savepoint called first 
-- meaning everything written after that line (save point first) will be rolled back 
-- and everything written before will still not be commited and transection remains open 
-- to save them we must run another commit statement which will save them and close the transection







