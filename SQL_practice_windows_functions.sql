use regex;

CREATE TABLE drivers (
  driver_id   INT PRIMARY KEY,
  driver_name VARCHAR(50) NOT NULL,
  base_area   VARCHAR(50) NOT NULL
);

-- -------------------------
-- Create table: trips  (DATE column included)
-- -------------------------
CREATE TABLE trips (
  trip_id      INT PRIMARY KEY,
  driver_id    INT NOT NULL,
  trip_date    DATE NOT NULL,
  distance_km  DECIMAL(5,1) NOT NULL,
  fare         INT NOT NULL,
  rating       DECIMAL(3,1) NOT NULL,
  CONSTRAINT fk_trips_driver
    FOREIGN KEY (driver_id) REFERENCES drivers(driver_id)
);

-- -------------------------
-- Insert data: drivers (4 rows)
-- -------------------------
INSERT INTO drivers (driver_id, driver_name, base_area) VALUES
(1, 'Asha',  'Indiranagar'),
(2, 'Ravi',  'Koramangala'),
(3, 'Meera', 'Whitefield'),
(4, 'Kabir', 'HSR Layout');

-- -------------------------
-- Insert data: trips (10 rows)
-- -------------------------
INSERT INTO trips (trip_id, driver_id, trip_date, distance_km, fare, rating) VALUES
(101, 1, '2025-11-01', 12.0, 350, 4.8),
(102, 1, '2025-11-02',  5.5, 180, 4.6),
(103, 2, '2025-11-01',  8.0, 260, 4.9),
(104, 2, '2025-11-03', 15.0, 500, 4.7),
(105, 3, '2025-11-02',  3.0, 120, 4.2),
(106, 3, '2025-11-04', 22.0, 780, 4.9),
(107, 4, '2025-11-01',  6.0, 210, 4.5),
(108, 4, '2025-11-03',  9.0, 300, 4.4),
(109, 4, '2025-11-04',  4.0, 150, 4.8),
(110, 1, '2025-11-04', 18.0, 620, 4.9);

-- Quick check
SELECT * FROM drivers ORDER BY driver_id;
SELECT * FROM trips ORDER BY trip_id;



-- 1. For each trip date show the number of trips , total fare and average rating
select trip_date , count(trip_id) as number_of_trips , sum(fare) as total_fare , avg(rating) as average_rating from trips group by trip_date;



-- 2. by base area show the total trips , total fare and average distance 
select d.base_area,count(t.trip_id) as total_trips,sum(fare) as total_fare , avg(distance_km) as average_distamce from drivers as d join trips as t on d.driver_id = t.driver_id group by base_area;



-- 3. show the number of trips with rating above 4.7 and number of trips rated below or equals to 4.7
select case 
	when rating >= 4.8 then 'high'
    else 'other'
end as rating_butcket,
count(trip_id) as trips 
from trips group by 
case 
	when rating >= 4.8 then 'high'
    else 'other'
end ;



-- 4. days where  total fare >= 800 
select trip_date,sum(fare) from trips group by trip_date having sum(fare)>=800;



-- 5. Trips with fare greater than the overall average fare
select trip_id , driver_id,fare from trips where fare > (select avg(fare) from trips);



-- 6. Drivers who have at least one trip rated 4.9 
select distinct d.driver_id,d.driver_name from drivers as d join trips as t on d.driver_id = t.driver_id 
where 4.9 in (select rating from trips as T where T.driver_id = d.driver_id);




-- 7. Drivers whose total fare is greater than the average total fare per driver
select new_t.driver_id,new_t.driver_name from (select d.driver_id,d.driver_name,sum(fare) as total_fare 
from drivers as d join trips as t on d.driver_id = t.driver_id 
group by driver_id) as new_t
where new_t.total_fare >
(Select avg(dt.total_fare) from (select sum(fare) as total_fare 
from trips group by driver_id) as dt);



-- 8. latest trip per driver
select * from trips as t where trip_date = (select max(trip_date) date from trips as it where it.driver_id = t.driver_id);



-- 9. row number of trips per driver ordered by date and then trip id
select driver_id,trip_id,trip_date,row_number() over(partition by driver_id order by trip_date,trip_id) 
from trips;



-- 10. Running total fare per driver over time
select driver_id ,trip_id ,trip_date ,fare , sum(fare) over (partition by driver_id order by trip_date) as running_fare from trips;



-- 11. rank the trips by fare within each driver (highest fare rank one )
select driver_id,trip_id,fare,rank() over(partition by driver_id order by fare desc) as fare_rank
from trips ;




-- 12. Show each trip’s fare minus the driver’s average fare (window AVG)
with cte as 
(select *,avg(fare) over(partition by driver_id) as agg from trips)
select driver_id , trip_id , fare , (fare-agg) as diff_from_age from cte;




-- 13. For each driver, show the previous trip’s fare (LAG) ordered by date
select driver_id,trip_id,trip_date,fare,lag(fare) over(partition by driver_id order by trip_date) from trips;











