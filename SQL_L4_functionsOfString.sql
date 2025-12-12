-- functions
/* set of statement
code reusable

scaler function -> row by row (result for each row )
multi line function 


*/

-- string function
-- case conversion 

use world;
select name ,continent  ,upper(name) ,lower(name) from country;

select name ,continent, concat(continent,'-','continent') from country;



-- there is another functin called concate-WS which takes a separator 
-- unlike the normal concate where we dont neccessarily need to separate them
-- here we give the first argument as the separator which will be used to separate all the data inside the concate 

select name ,continent, concat_ws('-',continent,code,'continent') from country;		
		-- see how it separates them using - where we only used it once 
        


-- second function :-  SUBSTRING
		-- extracting chr based on the positions
        -- remember that here the base is 1 and not 0
        -- so the index starts from 1
        
        
select name ,continent, substr(name,1) from country;		
		-- THIS MEANS we get the whole string 

select name ,continent, substr(name,2) from country;		
        -- this means we ignore the first chr and then get the whole remaining string  

-- currently we get all the string ignoring the first few selected chr        
-- what if we want only a certain number of chr


		-- syntax ==> subtr(column,starting index , total chr we want)


select name ,continent, substr(name,1,3) from country;		
		-- it means start from first chr and retreave 3 charector
        -- make sure you dont mistake it for index 1 to index 3
        -- also if a name has only 4 chr and we try to get 8 chr it will not show error but just retreive the all 4 chr
        
        
-- what if we want the starting point to be 3rd from the last or 2nd from the last ?

select name ,continent, substr(name,-4) from country;		

		-- it will give you last 4 chrs 
        -- here we didnt define the number of chr required because usually we need the all last 4 chr
        -- but we can deffine it if the need arrives 
        
select name ,continent, substr(name,-4,5) from country;		






-- Q. select the name , continent from country where first chr of continent is same as first chr of country

select name ,continent from country where substr(name,1,1) = substr(continent,1,1) ;		


-- what if we want a county whose name starts with alg
select name,continent from country where substr(name,1,3)  = 'alg' ;

-- we could also have done that with like 
select name,continent from country where name like 'alg%' ;







-- 3rd functionn instr(
	-- it finds the position/first occurance  of a chr in a string
    -- shows zero if chr not in the string
	-- syntax ==> instr(column,chr)
    
select name,continent,instr(name,'e') from country ;






-- we also have len function here by the name of length
-- but len gives the bites used which is same as umber of chr for most case but not always

select name,continent,length(name) from country ;


-- so we use char_length function 
select name,continent,char_length(name) from country ;







-- function 4 :-  trim

		-- it removes extra spaces or chrs
        -- it removes extra whitespaces or chrs from left and right 
        -- we also have ltrim and rtrim for only one side 
        -- by simple words it removes the leftmost and rightmost word 
        -- or multiple times if we want
        -- this function is case sensitive ('a' and'A' are different)
        -- it cant remove anything from middle 
        
select '    yash    ';			-- by the way this is valid way to create a data
select trim('    yash    ')	;	-- it removes whitespace by default 

-- to remove anything other than white space we can use trim but only if the data is on the either ending side 


select trim(both 'g' from '    yaggshggggg');		-- way to remove all the g on either end


select name,continent,trim(both 'A' from name) from country;		-- notice how it removed the capital A but not the small a on the ends










-- 5th function lpad and rpad
		-- make all the data of same lenght
        -- notice how adding 0 at the bigining of an int doesnt change its values
        -- but it makes our work easy
        -- syntax ==>  lpad(column,req chr , chr to add to make all data of same size )
        -- we moslty use lpad to add 0 to the starting
        -- it will keep adding 0 untill the data is not as long as we wanted 
        
        
        
select name,population , lpad(population,6,'#') from country;