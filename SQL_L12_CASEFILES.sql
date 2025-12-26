-- case file 

-- if (condition,true,false)

-- but this becomes hard if we a lot of conditions 
-- so we use case files

-- syntax :-
		--  case
		--		when condition then 'very small population'
        --		when confition2 then 'large population'
        
-- we can also use else condition here parallel to the case indentation
-- also we must end our case with end keyword 
-- it is also recomanded to use alias for it after the end keyword


use world;
select name , population ,
case
	when population = 0 then 'no population'
	when population < 10000 then 'SMALL POPULATION'
	else 'LARGE POPULATION'
end as population_description
from country;