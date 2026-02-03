
-- what if we want to filter number if row?
-- we use where clause 

describe city;
select * from city where district='Zuid-Holland' ;

-- here we only got the rows that had zuid holland in their district column



select * from city where countrycode='ARG';
-- we got cities that had arg as their country code
-- or we can say filtered city for arg code

-- if we write a country code that doesnt exist in our table then it wont show error but rather just give an empty result



-- more that 6 lakh population needed :-
select * from city where population>600000;

select * from city where countrycode!='ARG';


select * from country;




-- what if we need multiple conditions 
-- we can use or operator 
-- we can also use in operator

select * from country where continent in ('North America','Europe','Asia');

-- in operator is used to filter the data in the specific set of values
-- make sure these are separated with commas

-- always remember that if data doesnt exist SQL doesnt give you error but just an empty output





-- indipendence year :-

select name ,continent from country where indepyear in (1901,1960);

-- here we have no limitations on the filet and print part (select and from part)
-- they dont have to be same 





-- what if we want to find data in a range ?
-- we use between operator

select name,indepyear from country where indepyear between 1901 and 1960;

-- notice how it also include 1901 and 1960 themsekves



-- we can also use not between and not in 
select name,indepyear,continent from country where indepyear not between 1901 and 1960;
select name,indepyear from country where indepyear not in (1901,1960);


-- questions :-
	-- 1. get the code, the country name and the region where the region is not middle east 
	-- 2. get the name ,independence year and pop with a expected 10% increase in population
    -- 3. get all the columns of the countries where life expectancy is 38.3 or 66.4
	-- 4. get the name continent pop and gnt column where the pop is not from 5000 to 200000
    
    
select * from country;
select code,name,region from country where region != 'Middle East';

select name,indepyear,population*1.1 from country;

select * from country where lifeexpectancy in (38.3,66.4);

select name,continent,population,gnp from country where population not between 5000 and 200000;




-- like operator :-
-- it searches for pattern
-- special chr called wildcards
-- % (we are seraching zero or more char) 
-- if we write asia% then it will find every asia doesnt matter if it has any more charactors before or after it
-- for example it will find asian,asianic,croasia,etc


select name,continent from country where continent = 'ASIA' ;
select name,continent from country where continent like 'ASIA' ;

-- above two are almost same

select name,continent from country where continent like 'ASIA%' ;
select name,continent from country where continent like 'A%' ;
-- find all starting with a

select name,continent from country where continent like '%a' ;
-- find all ending with a

select name,continent from country where continent like '%A%' ;
-- find all containg a (doesnt matter if its in start,end or anywher in between)





-- there is another wildcard called _ that finds a single chr
-- _d will find every word that has d at 1st index( there is exactly one chr before it )
-- ___ d will find every word that has d at 3srd index( there is exactly 3 chr before it )
-- __ will find every word that has exactly two chrs
-- we can also use _ after the chr like (ir__) 

select name,continent from country where name like 'ir__';





-- learning assignment :-
	-- logical operators of sql 
    -- watch video on str function by regex
