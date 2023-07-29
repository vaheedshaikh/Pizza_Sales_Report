SELECT * FROM Pizza_Sales

--Total Revenue--
SELECT SUM(total_price) AS Total_Revenue
FROM Pizza_Sales;

--Average Order Value--
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_Order_Value
FROM Pizza_Sales;

--Total Pizza Sold--
SELECT SUM(quantity) AS Total_Pizza_Sold
FROM Pizza_Sales;

--Total Orders--
SELECT COUNT (DISTINCT order_id) AS Total_Orders
FROM Pizza_Sales;

--Average Pizza Per Order--
SELECT CAST(CAST(SUM(quantity) AS DECIMAL (10,2)) / CAST(COUNT(DISTINCT order_id)AS DECIMAL (10,2)) AS DECIMAL (10,2)) AS Avg_Pizza_Per_Order
FROM Pizza_Sales;

--Total Orders By Day--
SELECT DATENAME(DW, order_date) AS Order_day, COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza_Sales
GROUP BY DATENAME(DW, order_date)

--Total Orders By Month--
SELECT DATENAME(MONTH,order_date) AS MONTH_Name, COUNT(DISTINCT order_id) AS Total_orders
FROM Pizza_Sales
GROUP BY DATENAME(MONTH,order_date)

-- Total Revenue By Pizza Category--
SELECT PIZZA_CATEGORY , CAST(SUM(total_price) AS decimal(10,2)) AS Total_Revenue,
CAST(SUM(total_price) *100/ (SELECT SUM(total_price)
FROM pizza_sales) AS DECIMAL (10,2)) AS Percentage
FROM Pizza_Sales
GROUP BY pizza_category

-- Total Revenue By Pizza Size--
SELECT pizza_size, CAST(SUM(Total_price)AS decimal (10,2)) AS Total_Revenue,
CAST(SUM(Total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales)AS decimal(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY Total_Revenue DESC

--SALE by Pizza Category and Quantity--
SELECT pizza_category, SUM(quantity) AS Total_quantity_sold
FROM Pizza_Sales
GROUP BY pizza_category
ORDER By Total_quantity_sold DESC

--Top 5 Pizza By Revenue--
SELECT TOP 5 pizza_name , SUM(Total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Bottom 5 Pizza By  Revenue--
SELECT TOP 5 pizza_name, CAST(SUM(total_price)AS decimal(10,2)) AS Total_Revenue
FROM Pizza_Sales
GROUP BY pizza_name
ORDER BY Total_Revenue

--Top 5 Pizza By quantity--
SELECT TOP 5 pizza_name , SUM(Quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Bottom 5 Pizza By quantity--
SELECT TOP 5 pizza_name, SUM(Quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

--Top 5 Pizza By Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 Pizza By Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM Pizza_Sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC