

#create database retail_orders;
#select * from retail_orders.df_orders;

#drop table retail_orders.df_orders;
truncate retail_orders.df_orders;
create table  retail_orders.df_orders(
order_id int primary key,
order_date datetime,
ship_mode varchar(20),
segment varchar(20),
country varchar(20),
city    varchar(20),
state   varchar(20),
postal_code varchar(20),
region  varchar(20),
category varchar(20),
sub_category  varchar(20),
product_id    varchar(50),
cost_price    int,
list_price  int,
quantity    int,                   
discount_percent     decimal(4,2), 
discount             decimal(9,2),
sale_price           decimal(9,2),
profit               decimal(9,2) );

describe df_orders;
use  retail_orders;
select * from retail_orders.df_orders;

--#Q1-find top 10 highest revenue generating products
#select * from df_orders;
select product_id,category,sub_category,sum(sale_price) as total_sales 
from df_orders
group by product_id,category,sub_category
order by total_sales desc limit 10;

--#Q2-find top 5 highest selling product in each region
#select * from df_orders;
#select distinct(region) from df_orders;

with cte as (
Select region,product_id,category,sub_category,sum(sale_price) as total_sales
from df_orders
group by region,product_id
)
select * from (
select *,
row_number() over (partition by region order by total_sales desc ) as rn
from cte ) as a
where rn<=5;

--#Q3.find month over month sales comparison for 2022 vs 2023 eg.jan 2022 vs jan 2023
with cte as (
select month(order_date) as order_month ,year(order_date) as order_year ,sum(sale_price) as total_sales
from df_orders
group by order_month, order_year
)
select order_month,
sum(case when order_year=2022 then total_sales else 0 end) as 2022_sales,
sum(case when order_year=2023 then total_sales else 0 end) as 2023_sales 
from cte
group by order_month
order by order_month  ;

--#Q4.for each category which month had highest sales
#select * from df_orders;

with cte as(
select category,date_format(order_date,"%Y%M") as order_year_month,sum(sale_price) as total_sales
from df_orders
group by category, order_year_month
order by total_sales desc)
select * from (
select *,
row_number() over (partition by category order by total_sales desc ) as rn
from cte ) as a
where rn=1;


--Q5.which subcategory has highes growth by profit   in 2023 compare to 2022

select  * from df_orders;
with cte as (
select sub_category,sum(profit) as total_profit,year(order_date) as order_year
from df_orders
group by sub_category,order_year
)
,cte2 as (
select sub_category,
sum(case when order_year=2023 then total_profit else 0 end) as 2022_profit,
sum(case when order_year=2022 then total_profit else 0 end) as 2023_profit
from cte
group by sub_category )
select *,
(2023_profit-2022_profit)*100/2022_profit as profit_growth_2022_to_2023
from cte2
order by profit_growth_2022_to_2023 desc
limit 1 ;

