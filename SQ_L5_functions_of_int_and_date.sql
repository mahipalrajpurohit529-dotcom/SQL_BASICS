use world;
select lifeexpectancy, round(lifeexpectancy) from country;
		-- the main objective of theround function is round fig the floats to make them ints
        -- also we dont always have to round off the whole float 
        -- we can round off anywhere after the decimal
	
    
select 83.637, round(83.637, 2);
		-- this will result 83.64
		-- the 2 after the comma indicates that we will round off the second decimal lace


-- but what if we want to round off the once or tens place digits ?

select (456.2) , round (456.2,-1);
		-- it will round off the once place 
        -- the six will become ten then 
        -- one is added to 5 of 456 and 6 is elemeneted
        -- also it will destroy all after the once digit
        -- and make them all = 0
        -- including the once digit
        
	
select (456.2) , round (4562145.2,-3);
		-- if we write -x then there will be x zeroes in the answer
        
        
        
-- truncate 
-- we have another function called truncate that removes the decimal values 
-- just like round but no rounding off
-- it just eleminates the values without any rounding off

select (456.27) , round (456.27,1),truncate(456.27,1);







-- mod 
-- it is modulus 
-- it extract the remainder 

select (43) , mod(43,3);





-- pow 
-- power/ exponent
select  power(2,5);
		-- gives you 2 raised to the power of 5
        





-- to print date and time
-- now and current timstamp prints both
-- curdate and currentdate prints only date

select now(),curdate(),current_date(),current_timestamp(),current_time();








-- add date 
select now(),adddate(now(),2);
			-- this will add 2 to the date
            -- we are doing it with now 
            -- we can do it with any column containing date
            
select now(),adddate(now(),interval 3 month);
		-- add 3 months to now()
        


-- these are a lot of functions so use now and extract to remember :- 

select now(),extract(year from now());
select now() , extract(WEEK from now());		-- way to extract week number


-- we have data formate that give it in strin
select now() ,date_format(now(), 'month is %M and yearr is %w');










