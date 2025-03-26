use DataBaseName;

select * from Retails_Sale

-- Data Analysis & Business Key Problems & Answers

-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
SELECT * FROM Retails_Sale 
WHERE sale_date = '2022-11-05'
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
SELECT transactions_id FROM Retails_Sale 
WHERE category='clothing' and quantiy > 10 and year(sale_date) = '2022' and month(sale_date) = '11'
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) as Total_Sale from Retails_Sale
GROUP BY category
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT avg(age) as Average_Age FROM Retails_Sale 
WHERE category = 'Beauty'
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
SELECT transactions_id FROM Retails_Sale
WHERE total_Sale > 1000;
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category, gender, count(transactions_id) FROM Retails_Sale 
GROUP BY gender, category
ORDER BY gender ASC
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT TOP(1) Month as Best_Salling_Month, Averge_Sale FROM (
SELECT month(sale_date) as month, avg(total_sale) as Averge_Sale FROM Retails_Sale 
GROUP BY month(sale_date)
) as t1
ORDER BY Averge_Sale DESC

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
select top(5) customer_id, sum(total_sale) as total_Sales from Retails_Sale
Group by customer_id
Order by total_Sales Desc
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select category, count(Distinct customer_id) as unique_cust from Retails_Sale
group by category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
Select * ,
Case 
  when DATEPART(hour, Sale_time) < 12 Then 'Morning'
  when DATEPART(hour,Sale_time) >=12 and DATEPART(hour, Sale_time) < 17 Then 'Afternoon'
  ELSE 'Evening'
End as Shift
FROM Retails_Sale
