create schema cars;
use cars;

-- READ DATA --
select*from car_dekho;

-- Total Cars: To get a count of total records--
select count(*)from car_dekho;

-- The manager asked the employee how many cars will be available in 2023 --
select count(*)from car_dekho where year =2023;

-- The manager asked the employee how many cars will be available in 2021,2022,2023 --
select count(*)from car_dekho where year in (2021,2022,2023)group by year;

-- Client asked me to print the total of all cars by year. I don't see all the details -- 
select year ,count(*)from car_dekho group by year;

-- Client asked to car dealer agent. How many diesel cars will there be in 2020 --
select count(*)from car_dekho where year = 2020 and fuel="Diesel";

-- Client asked to car dealer agent. How many Petrol cars will there be in 2020 --
select count(*)from car_dekho where year = 2020 and fuel="Petrol";

-- The manager told to empolyee to give a print all the fuel cars (Petrol, Diesel and CNG) come by all year --
 select year,count(*)from car_dekho where fuel = "Petrol" group by year;
 select year,count(*)from car_dekho where fuel = "Diesel" group by year;
 select year,count(*)from car_dekho where fuel = "CNG" group by year;
 
 -- Manager said there were more than 100 cars in a given year, which year had more than 100 cars --
 select year,count(*)from car_dekho group by year having count(*)>100;
 
 -- Manager said there were less than 100 cars in a given year, which year had less than 100 cars --
select year,count(*)from car_dekho group by year having count(*)<100;

-- The manager said to the empolyee all cars count details between 2015 to 2023, we need complete list --
select count(*)from car_dekho where year between 2015 and 2023;

-- The manager said to the empolyee all cars details between 2015 to 2023 we need complete list --
select*from car_dekho where year between 2015 and 2023;

-- How many unique sellers are there in datasets --
select count(*) from car_dekho where seller ="unique";

-- What is a average mileage for cars running on diesel --
SELECT AVG(mileage) AS avg_mileage_diesel FROM car_dekho WHERE fuel = 'Diesel';

-- Identify top 5 cars with the best mileage --
SELECT * FROM car_dekho ORDER BY mileage DESC LIMIT 5;

-- Identify top 5 cars with the least mileage --
SELECT * FROM car_dekho ORDER BY mileage ASC LIMIT 5;

-- How many cars are being sold by each seller type --
SELECT seller_type, COUNT(*) AS total_cars FROM car_dekho GROUP BY seller_type;

-- What is the average selling price for each seller type --
SELECT seller_type, AVG(selling_price) AS avg_price FROM car_dekho GROUP BY seller_type;

-- Do automatic transmission cars have a higher average selling price than manual transmission cars --
SELECT transmission, AVG(selling_price) AS avg_price FROM car_dekho GROUP BY transmission;

-- How many cars with automatic transmission have more than 5 seats --
SELECT COUNT(*) AS cars_with_auto_transmission_and_more_than_5_seats FROM car_dekho WHERE transmission = 'Automatic' AND seats > 5;

-- What is the distribution of cars based on the number of owners --
SELECT owner, COUNT(*) AS total_cars FROM car_dekho GROUP BY owner;

-- Calculate the average selling price for cars with different owner counts --
SELECT owner, AVG(selling_price) AS avg_price FROM car_dekho GROUP BY owner;

-- What is the overall trend in car sales over the past few years --
SELECT year, COUNT(*) AS total_sales FROM car_dekho GROUP BY year ORDER BY year;

-- Are there any patterns or trends in the selling prices of cars that we should be aware of--
SELECT AVG(selling_price) AS avg_price_trend FROM car_dekho GROUP BY year ORDER BY year;

-- How does the average selling price vary across different fuel types and transmission options--
SELECT fuel, transmission, AVG(selling_price) AS avg_price FROM car_dekho GROUP BY fuel, transmission;

-- What are the most popular fuel types among our customers--
SELECT fuel, COUNT(*) AS fuel_preference FROM car_dekho GROUP BY fuel ORDER BY fuel_preference DESC;

-- What is the distribution of car listings based on the number of owners --
SELECT owner, COUNT(*) AS owner_distribution FROM car_dekho GROUP BY owner;

-- Can you identify different customer segments based on their preferences and buying behavior --
SELECT fuel, transmission, COUNT(*) AS customer_segment FROM car_dekho GROUP BY fuel, transmission;
