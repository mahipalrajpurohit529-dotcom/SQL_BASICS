-- agregate functions 

use world;


-- 1. count() :-


select * from country;			-- * will coult all the rows
select count(indepyear) from country;			-- column name exclude the null rows when counting

select count(*), count(indepyear) from country;




-- 2. sum() :- gives you the sum of all rows for that column
-- 3. average() :- gives you the average of all rows for that column

-- 4. distinct () :- it counts unique values of rows for that column
			-- WE DONT USE () IN DISTINCT
            
select distinct continent from country;
		
        -- we can also use it for multiple columns 
        -- this will give us unique pairs 
        
select distinct continent,region from country;



-- we can use the functions inside another like python 

select count(distinct region ) from country;

select sum(population),count(name), count(distinct indepyear) from country where continent ='africa' ;  




-- QUESTION :-
-- get the total countries , avg surface are and the total population for the countries which got there indep from 1947 to 1998 and dont include these two in indep year
select count(name),avg(surfacearea),sum(population) 
from country 
where indepyear between 1948 and 1997;

-- or we can use 
select count(name),avg(surfacearea),sum(population) 
from country 
where indepyear>1947 and indepyear<1998;





-- QUESTION :-
-- get the total number of counties and the number of unique continents 
-- along with the avg population and the total number of capitals for the countries starting with a or d 

select 
	count(name) as countryName,
    count(distinct continent) as Continent_count,
    avg(population) as Average_population,
    sum(capital) as Unique_capital_count
from country where name like 'a%' or name like 'd%'; 

-- we used sum because count would just give you the number of capitals 
-- like if a country has 40 capirtals we are just counting 40 as 1
-- so we use sum 



select count(name),continent from country;
	-- this will show error as we cant use aggregate function with normal column
    -- but it would work if all the elements of the normal column are same 
    
select count(name),continent from country where continent='asia';

    -- this happans because we are printing a single value/row in one column and multiple rows in the other one
    -- but we cant just count the countries from each continent and then sum them as it would take a long time
    
-- so we use a tool called group by that helps us do it
-- its work is to select multile value by group

select continent from country group by continent;
			-- it gives you unique values
            -- its work is to collect similer values 
            
select continent,count(*) from country group by continent;
select indepyear,count(*) from country group by indepyear;

	-- indeyear will list you all the unique indepyears 
    -- count(*) will give you the number of time that indep year was used 
    -- or how many countries had that year as indepyear
    -- so the countries are here grouped based on the indepyear

-- whenever we use groupby , we cant use any other column than the one we used 
-- like everything is now grouped by it so you cant ask to print something directly
-- it has to be by the group


select continent,count(name) ,sum(population),max(population),min(indepyear)
from country group by continent;
	


-- you have to find the total cities ,the total district,unique district,the total population from the city table
 
 select 
	count(name) as total_cities,
    count(district) as total_districts,
    count(distinct district) as unique_districts,
    sum(population) as total_population
from city ;