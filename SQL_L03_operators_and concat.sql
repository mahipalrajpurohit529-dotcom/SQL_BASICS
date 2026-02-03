-- get the name continent and region from the country table where the continent is not same as europe 
-- get the name cont and region where the second letter of a region is a
-- get the name cont and region where the cont the third last chr is i
-- get the name nont and region where the cont should be of minimum 5 chr
-- get the name cont and region where the second letter is c and second last chr is i in region
-- get the name cont and region where at least two a should be present separated with a chr in name

use world;

select name,continent,region from country where continent != 'europe';
select name,continent,region from country where region like '_a%';
select name,continent,region from country where continent like '%i__';
select name,continent,region from country where continent like '_____%';
select name,continent,region from country where continent like '_c%i_';
select name,continent,region from country where name like '%a_a%';







-- operators in SQL :-
	-- AND operator
		-- all conditions should be true to return true
	-- or operator 
		-- at least one condition should be true to return true
        
select name,continent from country where continent='asia' or continent ='africa';

-- if you look carefully then you will see that you only have one data in each row 
-- so you cant use and operator for the same column
-- like yo cant say where " continent ='asia' and continent='africa' " 
-- it will not show any error but also wont show any data
-- so always use and operator on multiple columns but never the same 


select name,continent,region from country where continent='asia' and  region = 'middle east';
select name,continent,region from country where continent='africa' or  region = 'middle east';
select name,continent,region from country where continent='africa' or indepyear between 1900 and 2000;



select name,continent from country where continent like name;
-- this filter the rows that has continent = name


select name,code,concat(name,',',code) from country ;
-- it gives you an extra column the same way the arithemetic operators on population did

-- we can compare it too :-
select name,continent,concat(name,code) from country where name like concat(name,code);

-- Find the country where the capital is the country plus "City".
select name from country where capital like concat(name,);






