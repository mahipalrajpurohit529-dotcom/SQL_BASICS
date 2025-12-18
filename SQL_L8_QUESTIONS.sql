use sakila;
show tables;
select * from payment;

-- you need to find out the number of transectyion for each customer where the amount is greater than 3

select customer_id,count(*),sum(amount) from payment where amount>3 group by customer_id;


-- find total number of transection for each amount in may month
select amount,count(*) from payment where month(payment_date)=5 group by amount; 


-- find out maximum amount spend ,the avg spend and the total amount spent for each staff
-- find out maximum amount spend ,the avg spend and the total amount spent for each staff  only for the customer id 1,3,7,11

select staff_id,max(amount),avg(amount),sum(amount) from payment group by staff_id;
select staff_id,max(amount),avg(amount),sum(amount) from payment  where customer_id in (1,3,7,11) group by staff_id ;


-- find total amount spend and the number of customer who payed in each month where the amount spend should be greater than 1
select month(payment_date), sum(amount),count(customer_id) from payment where amount>1 group by month(payment_date);