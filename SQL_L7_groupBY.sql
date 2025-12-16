use world;

-- GROUP BY:-
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


-- eg ==> 

select region,avg(population) from country group by region;
select district,count(name) as total_cities from city group by district;		


-- we can use filter with group by too :- 

select district,count(name) from city where population>100000 group by district;

			
            
            
            -- always remember that where always runs first to filter the data 
            -- then the group by runs 
            -- then the agregate functions


-- find out the count of the countries from all continents that has indepyear greater than 1950
select continent,count(name) from country where indepyear>1950 group by continent;


-- find out the contname which has a population greater than 100
select continent,sum(population) from country where population>30401150 group by continent;

			-- notice that it works but apply filter on og column
            -- this is because where only filter the data that exist in our og table 
            -- and sum(population) cant be filtered here 
			-- so we use having filter 
			-- having helps apply filter to the agregate function
			-- also remember that having is used after the group by unlike the where clause 


			-- where will filter first and then the group by runs 
            -- but in having , the group by runs first and then it filters using having
			-- so if you need to filter first then use where and if you have to filter after grouping then use having


select continent,sum(population) from country group by continent  having sum(population)>30401150;






-- get the total population of the continents for each continent which have a life expectancy of greater than 35

select continent,sum(population) from country where lifeexpectancy>35.0 group by continent;



select * from country;
-- find out the total countries for each govt firm where the total number of countries is greater than 30
-- find out the total countries for each govt firm only for the countries having their catpital > 30 and total population >300000

select governmentform,count(name) from country group by governmentform having count(name)>30;
select governmentform,count(name) from country where capital>30 group by governmentform having sum(population) >300000;





-- what if we want a sub group 
-- like if we needed to group by continent and then group by region 
-- like what if they ask us to find the total count of countries of each region of each continent
-- we simply use comma after grp by 

select continent,region,count(name) from country group by continent,region;
