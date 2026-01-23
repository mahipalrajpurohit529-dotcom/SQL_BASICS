-- Create table: events
use regex;
-- -------------------------
CREATE TABLE events (
  event_id   INT PRIMARY KEY,
  event_name VARCHAR(100) NOT NULL,
  city       VARCHAR(50)  NOT NULL
);

-- -------------------------
-- Create table: ticket_sales
-- -------------------------
CREATE TABLE ticket_sales (
  sale_id          INT PRIMARY KEY,
  event_id         INT NOT NULL,
  sale_date        DATE NOT NULL,
  ticket_type      VARCHAR(20) NOT NULL,
  qty              INT NOT NULL,
  price_per_ticket INT NOT NULL,
  CONSTRAINT fk_ticket_sales_event
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

-- -------------------------
-- Insert data: events
-- -------------------------
INSERT INTO events (event_id, event_name, city) VALUES
(1, 'Music Fest', 'Mumbai'),
(2, 'Tech Summit', 'Bengaluru'),
(3, 'Food Carnival', 'Delhi'),
(4, 'Startup Meetup', 'Mumbai');

-- -------------------------
-- Insert data: ticket_sales
-- -------------------------
INSERT INTO ticket_sales (sale_id, event_id, sale_date, ticket_type, qty, price_per_ticket) VALUES
(101, 1, '2025-01-05', 'Regular', 2, 1500),
(102, 1, '2025-01-10', 'VIP',     1, 5000),
(103, 2, '2025-02-03', 'Regular', 3, 2000),
(104, 2, '2025-02-10', 'VIP',     1, 6000),
(105, 3, '2025-03-01', 'Regular', 5,  800),
(106, 3, '2025-03-15', 'VIP',     2, 2500),
(107, 4, '2025-01-20', 'Regular', 4, 1200),
(108, 4, '2025-02-05', 'Regular', 1, 1200);

-- Quick check
SELECT * FROM events ORDER BY event_id;
SELECT * FROM ticket_sales ORDER BY sale_id;






-- PRACTICE QUESTION 

-- 1 Find the total quantity sold per event_id
select event_id,sum(qty) from ticket_sales group by event_id;


-- 2 total revenue per event_id
select event_id,sum(qty*price_per_ticket) from ticket_sales group by event_id;


-- 3 monthly total revenue 
select month(sale_date),sum(qty*price_per_ticket) from ticket_sales group by month(sale_date);


-- 4 find the max price per ticket per event id 
select event_id,max(price_per_ticket) from ticket_sales group by event_id;


-- 5 total revenue and ticket types per month
select month(sale_date),ticket_type,sum(qty*price_per_ticket) as total_revenue from ticket_sales group by month(sale_date),ticket_type;



-- 6 list all saleswith event_name and sale date 
select  ts.sale_id,e.event_name,ts.sale_date from events as e right join ticket_sales as ts on e.event_id = ts.event_id ;



-- 7 show event name ,ticket type and qty for each sale
select e.event_name,ts.ticket_type,ts.qty from events as e join ticket_sales as ts on e.event_id = ts.event_id ;



-- 8 show sales where event city is mumbai
select * from events as e join ticket_sales as ts on e.event_id = ts.event_id where e.city='Mumbai';



-- 9 show all events and matching sales
select e.event_name,ts.sale_id,ts.sale_date from events as e join ticket_sales as ts on e.event_id = ts.event_id ;



-- 10 show distinct event name where tickets were sold
select distinct e.event_name from events as e join ticket_sales as ts on e.event_id = ts.event_id ;



-- 11 show each sale's computed revenue with event name 
select ts.sale_id , e.event_name , (qty*price_per_ticket) as revenue from events as e join ticket_sales as ts on e.event_id = ts.event_id ;



-- 12 total quantity of sales per event
select e.event_name , sum(qty) from events as e join ticket_sales as ts on e.event_id = ts.event_id group by e.event_name ;



-- 13 find total vip revenue per event
select event_name ,sum(qty*price_per_ticket) from events as e join ticket_sales as ts on e.event_id = ts.event_id where ts.ticket_type = 'VIP' group by event_name;




-- 14 find mopnthly revenue per city
select e.city,month(ts.sale_date),sum(ts.qty*ts.price_per_ticket)from events as e join ticket_sales as ts on e.event_id = ts.event_id group by e.city,month(ts.sale_date) order by e.city;



-- 15 find the total quantity per city and ticket type 
select e.city,ts.ticket_type,sum(qty) as qtty from events as e join ticket_sales as ts on e.event_id = ts.event_id group by e.city,ts.ticket_type order by e.city;




-- 16 find the latest sale 
select * from events as e join ticket_sales as ts on e.event_id = ts.event_id where sale_date = (select max(sale_date) from ticket_sales);



-- 17 find the sales where the revenue is greater than the overall average sale revenue
select ts.sale_id,ts.event_id,qty*price_per_ticket as revenue from events as e join ticket_sales as ts on e.event_id = ts.event_id where qty*price_per_ticket > (select avg(qty*price_per_ticket) from ticket_sales);




-- 18 find the events that have at least one vip sale
select distinct e.event_name from events as e join ticket_sales as ts on e.event_id = ts.event_id where ts.ticket_type = 'VIP';



-- 19 find the events in the cities that have at least one VIP sale 
select distinct e.event_id,e.event_name,e.city from events as e join ticket_sales as ts on e.event_id = ts.event_id 
where city in (select e.city from events as e join ticket_sales as ts on e.event_id = ts.event_id where ts.ticket_type = 'VIP');




-- 20 find the events that have at least one sale in february
select distinct ts.event_id,e.event_name,e.city from events as e 
join ticket_sales as ts on e.event_id = ts.event_id 
where month(ts.sale_date) = '02' and year(ts.sale_date) = '2025';



-- 21 for each event , return the highest price_per_ticket sale 
select ts.* from events as e 
join ticket_sales as ts on e.event_id = ts.event_id 
where ts.price_per_ticket in 
(select max(price_per_ticket) from ticket_sales as TS where TS.event_id = ts.event_id group by TS.event_id);




-- 22 Show monthly total revenue and monthly total quantity, but only include months where total revenue is at least 10,000.
select month(ts.sale_date),sum(ts.qty) as total_qty,sum(ts.qty*ts.price_per_ticket) as total_revenue
from events as e join ticket_sales as ts on e.event_id = ts.event_id 
group by month(sale_date) having sum(qty*price_per_ticket) >=10000;



-- 23 Show month-wise count of sales rows, but only include months that have at least 3 sales rows. 		**** not matching expected output
select month(ts.sale_date) , count(ts.sale_id) 
from ticket_sales as ts
group by month(ts.sale_date) having count(ts.sale_id) >= 3;




																										-- not matching expected output
-- 24 Show average revenue per sale row per month, but only include months where average sale revenue is above 4000. sale_month avg_sale_revenue
select month(ts.sale_date) , avg(ts.qty*ts.price_per_ticket) as avg_sale_revenue
from events as e join ticket_sales as ts on e.event_id = ts.event_id 
group by month(ts.sale_date) having avg(ts.qty*ts.price_per_ticket) > 4000;



																							-- not matching expected outcome
-- 25 show revenue per month and ticket type but only include groups where total revenue is at least 5000
select month(ts.sale_date),ts.ticket_type,sum(ts.qty*ts.price_per_ticket) 
from events as e join ticket_sales as ts on e.event_id = ts.event_id 
group by month(ts.sale_date),ts.ticket_type
having sum(ts.qty*ts.price_per_ticket) >= 5000

