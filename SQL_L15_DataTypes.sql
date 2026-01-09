-- DATA TYPES IN SQL :-
	-- 1.NUMERIC :- 
		-- int
			-- tiny int (1 byte),
			-- small int (2 byte),
            -- medium int (3 byte),
            -- int (4 byte),
			-- big int (8 byte)
        -- decimal
			-- float (4 byte) used when rounding after decimal is okay
            -- double	(8 byte) used when we need exact number 
    
    
use regex;
create table test10(id tinyint);
insert into test10 values(1),(-127),(-128);
insert into test10 values (128);				-- OUT OF RANGE ERROR

select * from test10;

-- tiny int stores values from -128 to 127 
-- but we can use name tinyint unsigned, which will have range of 0 to 255

create table test11(id tinyint unsigned);
insert into test11 values (129),(255);
insert into test11 values (256);			-- OUT OF RANGE ERROR



-- decimal :-

create table test12 (price float);
insert into test12 values (12.4),(10.3485756);
insert into test12 values (10.34857567585);		-- double doesn't rounds of the decimal place 

select * from test13;

create table test13(price double);
insert into test13 values (10.34857567585);		-- float rounds of the decimal place 


-- we can also define how long we want the doubles and floats to be 
-- we can define their size as we desire

create table test14(price2 double(5,2));
		-- we want 5 character long double here and only 2 numbers after the decimal
        -- even when we give higher values it still will only take 2 

insert into test14 values (98.1);		-- works fine
insert into test14 values (98.15);		-- works fine
insert into test14 values (4.11567);	-- works fine will igrone values after second decimal place
insert into test14 values (195.34535);  -- works fine but will ignore the values after the second decimal place
insert into test14 values (1955.47557); -- shows error as we define that ther will only be 3 values before decimal

select * from test14;




-- 2. CHAR AND VARCHAR :-
	-- VARCHAR is a datatype => string/character values
	-- char => character but fix length of character
			-- we can fix the length to 10 
            -- but when we give the name only 5 letter , then it will still take memory of 10 units
            -- you might think it takes size in byte as argument
            -- but in truth it actually takes the char length as the argument
            -- it doesnt normally matter in english but if we use a chr from another language it matters
            

create table test15 (name char(10));
insert into test15 values ('abc'),('defghi');
insert into test15 values ('sadfjkhfdaf');			-- ERROR -> TOO LONG

select * from test15;
