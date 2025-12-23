use world;
-- (join) keyword :-
	-- used to connect to tables
    -- to extract data 

select * from city;

		-- id, and population are the only unique  data
        -- we choose id as it is smaller in nyumbers
        -- so id becomes our primary key (PK)

        
-- or we can use describe city to see if there is any already defined primary key
describe city;


-- we can also check if the count(x) and distinct(count(x)) are same or not 
-- if they are same then all valued are unique and we can choosee that column to be our primary key

describe country;


-- now to join country and city table we need some commen ground 
-- we can see that country code (or called code  in country table )is present in both the country and city table
-- now only the code from country table is our primary code 
-- because the code in country table is unique 
-- we do it so that there is only many-one or one-one relation so that when we search for something we get only one answer




use sakila;

-- get the city name and its country name :- 

-- select ct.nam/nd out the actor id and the first name along with its film id 

select ac.actor_id,ac.first_name , fa.film_id from  actor as ac  
join film_actor as fa 
where fa.actor_id = ac.actor_id;





-- actor name ,movie he worked on use  actor , film_actor .film table


select * from actor;
select * from film_actor;
select * from film;

select * from actor;  -- actor_id is primary key 
select * from film_actor; -- actor_id is foriegn key 
select * from film; -- film_id is primary key
select ac.first_name , f.title from actor as ac
join film_actor as fa join film as f
where ac.actor_id = fa.actor_id and fa.film_id = f.film_id;









use regex;


select * from customers;
select * from orders;

select c.customer_id , c.customer_name , o.customer_id , o.order_id , o.amount 
from customers as c join orders as o
where c.customer_id = o.customer_id;


-- latest and modern SYNTAX :-
 
select c.customer_id , c.customer_name , o.customer_id , o.order_id , o.amount 
from customers as c INNER join orders as o
on c.customer_id = o.customer_id;







-- left  join :- 
		-- it will print all the values for the left table 
        -- if it doesnt have any value in the right table then it will show null
        -- but all values/rows of the left table will be shows 

select c.customer_id , c.customer_name , o.customer_id , o.order_id , o.amount 
from customers as c left join orders as o
on c.customer_id = o.customer_id;


		-- it gives you the info of all the rows of left sde
        


-- right join :-
		-- this is same as the left join but just gives you all the rows of the right table 
        -- weather or not it has anything corresponding to it in the left table


select c.customer_id , c.customer_name , o.customer_id , o.order_id , o.amount 
from customers as c right join orders as o
on c.customer_id = o.customer_id;




				-- inner join gives you the commen data
                -- left join gives you the commen and whole left table
                -- right join give you the commen and right table 
                

-- natural join (useless join):-
			-- it is used to make the syntax small
            -- it is not used anywhere 
            -- it works okay and dont require us to give the conditions 
            -- but only if both the tables have a commen column name
            -- otherwise it will give some unwanted result
            
select c.customer_id , c.customer_name , o.customer_id , o.order_id , o.amount 
from customers as c natural join orders as o;

		-- here the output remains same and code is smaller 
        -- so you migh think it is helpfull
        -- but it is only because both the tables have a common column name





select c.customer_name , sum(amount) 
from customers as c INNER join orders as o
on c.customer_id = o.customer_id  group by c.customer_name;

