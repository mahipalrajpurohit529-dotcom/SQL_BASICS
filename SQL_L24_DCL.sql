
-- DCL :- Data Control Language

	-- here we define the permissions/accessiblity of the users
    -- it is of two types :- 
				-- AUTHENTICATION 
                -- AUTHORIZATION


-- to create user :- 

create user me identified by 'xyz';

create database tushardb;

create table tushardb.actor1 as 
select * from sakila.actor where actor_id between 1 and 5;

create table tushardb.actor2 as 
select * from sakila.actor where actor_id between 3 and 10;







-- show permissions :- 
show grants for me ;



-- granting permission :- 
grant select,delete  		-- GRANTING ONLY two privilages 
on tushardb.*
to me;


grant all privileges 		-- granting all permissions 
on tushardb.*
to me ;




