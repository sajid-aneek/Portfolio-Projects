Select * From WalmartSalesData

-- Feature Engineering: This will help use generate some new columns from existing ones.
-- Time_of_day

Select 
time,
(CASE 
WHEN time  Between '00:00:00' and '12:00:00' then 'Morning'
WHEN time Between '12:01:00' and '16:00:00' then 'Afternoon'
Else 'Evening' 
END
) as time_of_day
From WalmartSalesData

Alter table WalmartSalesData ADD time_of_day VARCHAR(20)

UPDATE WalmartSalesData 
SET time_of_day = (CASE 
WHEN time  Between '00:00:00' and '12:00:00' then 'Morning'
WHEN time Between '12:01:00' and '16:00:00' then 'Afternoon'
Else 'Evening' 
END)


-- Day Name 

Alter table WalmartSalesData ADD day_name VARCHAR(20)

Select 
date, 
DATENAME(dw, date) as day_name
From WalmartSalesData

Update WalmartSalesData 
SET day_name = DATENAME(dw, date)


-- Month Name 

Alter table WalmartSalesData ADD month_name VARCHAR(20)

Select 
date, 
DATENAME(month, date) AS month_name
From WalmartSalesData

Update WalmartSalesData 
SET month_name = DATENAME(month, date)

-- Generic Questions 
-- How many unique cities does the data have? -- 

Select COUNT(DISTINCT city) as distinct_cities_count
From WalmartSalesData

-- In which city is each branch?-- 
Select 
Distinct City, Branch
From WalmartSalesData
Order by Branch DESC

-- Product Questions 
-- How many unique product lines does the data have? --

Select COUNT(Distinct product_line)
From WalmartSalesData

-- What is the most Common payment method? -- 
Select payment, Count(Payment) cnt
From WalmartSalesData
Group BY Payment
ORDER BY cnt DESC

-- What is the most selling product line? 
Select Product_line, COunt(Product_line) as cnt
From WalmartSalesData
Group by Product_line
Order by cnt DESC

-- What is the total Revenue by month? 
Select month_name, SUM(Total) revenue
From WalmartSalesData
Group By month_name
Order by revenue DESC

-- What month had the largest COGS? 
Select month_name, SUM(cogs) largest_COGS 
From WalmartSalesData
Group by month_name
order by largest_COGS DESC

