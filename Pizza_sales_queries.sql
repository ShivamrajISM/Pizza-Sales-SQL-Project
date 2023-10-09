Select * from orders;

/*Total Revenue */
Select Sum(total_price) AS Total_Revenue from Orders; 

/* Average Order Value */
Select Sum(total_price)/Count(distinct order_id) as AOV from orders;

/* Total Pizzas Sold */
Select Sum(quantity) As Total_Pizzas_Sold from orders;

/* Total Orders */
Select Count(Distinct Order_id) As Total_Orders from Orders;

/* Average Pizzas Per Order */
Select Cast(Cast(Sum(quantity) as Decimal(10,2))/Count(Distinct Order_id) As Decimal(10,2)) as Avg_Pizza_per_Order 
from orders;

/* Daily trend for Total Orders */
Select to_char(order_date, 'DAY') as order_day, count(distinct order_id)
from orders
group by order_day;

/*Monthly  Trend for Total Orders */
Select to_char(order_date, 'MONTH') as order_month, count(distinct order_id) from 
orders
group by order_month;


/*Percentage of sales by Pizza Category */
Select pizza_category, sum(total_price) *100 / (Select sum(total_price) from orders) as Percentage_Sales
from orders
group by pizza_category;

Select * from orders

/*Total Pizzas sold by Pizza category */
Select pizza_category, sum(quantity) as Total_Pizzas 
from orders
group by pizza_category;

/*Top 5 best sellers by revenue,total quantity, total orders */
Select pizza_name,sum(quantity * unit_price)  as revenue, sum(quantity) as total_quantity, sum(order_id) as total_orders
from orders
group by pizza_name
order by revenue desc, total_quantity desc, total_orders desc
Limit 5;

Select pizza_name, sum(quantity) as total_quantity
from orders
group by pizza_name
order by total_quantity desc
Limit 5;

Select pizza_name, count(distinct order_id) as total_orders
from orders
group by pizza_name
order by total_orders desc
Limit 5;






