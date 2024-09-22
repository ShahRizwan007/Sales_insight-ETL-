alter user postgres with password 'Rizpostsql';

select * from df_orders;

--Q1.Find top 10 highest revenue genrating product

select  product_id,sub_category,category,sum(sell_price) as total_sells
from df_orders
group by product_id,sub_category,category
order by total_sells desc
limit 10;

--Q2.find top 5 highest selling product in each region

with cte as (
select  region,product_id,sub_category,category,sum(sell_price) as total_sells
from df_orders
group by region,product_id,sub_category,category
)
select * from (
select *,
row_number() over (partition by region order by total_sells desc ) as rn
from cte ) where rn<=5;


--Q.Calculate the total sales (sell_price) and total profit for each category.
--select * from df_orders;
select category,sum(sell_price) as total_sales,sum(profit) as total_profit
from df_orders
group by category 
order by category,sum(sell_price),sum(profit);

--Q.Find the total number of orders and total sell_price for orders placed in the year 2023.
select * from df_orders;
--Answer:
with cte as (
select to_char(order_date,'YYYY') as order_year,
count(order_id) as total_orders
,sum(sell_price) as total_sales
from df_orders
group by order_year
order by order_year )
select *,
row_number() over (partition by order_year order by order_year desc) as rn
from cte limit 1;


--Answer:
SELECT 
EXTRACT(YEAR FROM order_date) AS order_year,
COUNT(order_id) AS total_orders,
SUM(sell_price) AS total_sales
FROM df_orders
WHERE 
EXTRACT(YEAR FROM order_date) = 2023
GROUP BY order_year;

--Q.For each region, find the average profit and total quantity sold. Display the results in descending order of average profit.
select * from df_orders;


select region,round(avg(profit),2) as average_profit,sum(quantity) as total_quantity_sold
from df_orders
group by region
order by average_profit desc;

--Q.Extract the month and year from order_date and calculate the total sales (sell_price) for each month of 2022

with cte as (
select extract (year from order_date) as order_year,
extract(month from order_date) as order_month,
sum(sell_price) as total_sales
from df_orders
where extract (year from order_date)=2022
group by order_year,order_month
order by order_year,order_month)

select distinct(extract(month from order_date)) as order_month
from df_orders;

