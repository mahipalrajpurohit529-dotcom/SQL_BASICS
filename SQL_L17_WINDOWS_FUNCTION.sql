
-- WINDOWS FUNCTION :- 
		-- A SQL window function is used to perform the calculation on the set of rows 
        -- with reference to the current row without murging the rows into a single output
        -- unlike GROUP BY it doesnt give the output in a single output
        -- but rather give the answer in a new column
        
        
-- WINDOWS FUNCTION HAS 3 main ways :-
	
-- 1.OVER :- 
	-- used to apply the function over a window (group)


use world;
select code ,name,population from country;

	-- now we want another column that shows the population of the whole world in a column next to each row
	-- we can do it by normal sub quaries and we can make it work 
select code ,name,population,(select sum(population) from country) from country;

	-- but what if we also want another column showing the population of the related continent 
    -- you might think we can do this with corelated sub quary
    -- but the thing is that the corelated subquary can only be used to filter the data and not print it
	-- and lets not forget about the conditions 
    -- if we wanted to use the conditions or filters here , there would be a lot of problems
    -- so we use WINDOWS_FUNCTION
	-- we use OVER for this perticular case


select code,name,continent,population,sum(population) over(),avg(population) over() from country;


-- 2. Partition By 
	-- SYNTAX :- Over(partision by column_name)
	-- something like group by
    -- devides the data into group and apply the logic on each group
    -- if we want the population the related continent to be printed along side the name of the country

select code,name,continent,population,sum(population) over(partition by continent ),avg(population) over() from country;






-- 3.ORDER BY (with over):-
	-- SYANTAX :- over(order by column_name)
    -- it shows running sum
    -- we order by population
    -- first few rows will have zero population and sum will also be zero
    -- then a country comes with 2000 population then the sum becomes 2000 and shows parallel
    -- then comes another one with 4000 population and some will show to be 6000
    -- but when the next group of countries come where 3 countries each have a population of 10k 
    -- then we get 36k as cummulative sum shown in front of all three and not 16,26,36
    -- so it performs calculations based on the groups


select code,name,continent,population,sum(population) over(order by population),avg(population) over(order by population) from country;


    
    