## TITLE: Sales and Profit Performance Dashboard with SQL Integration - Financial Sample Case Study

### Overview

This project presents an interactive Sales and Profit Performance Dashboard built to analyze key business metrics including Revenue, Sales and Time Analysis, Profit, Country Performance and Discount Analysis. The dashboard integrates SQL and Power BI for data querying, ensuring real-time data insights and optimized backend processing.

The goal is to provide actionable insights to help stakeholders understand:

	1) Which countries or regions are most profitable
	2) Monthly trends in sales and profit
	3) Product-Level performance
	4) Discount Analysis by Region and Products


### Tools

	* SQL - Data extraction, transformation and filtering
	* Python (Optional) - For data preprocessing
	* Power BI 
	* CSV - Data Source
	* Git & Github - Version control and portfolio presentation
	* Medium & Kaggle - Showcase to the data science community

### Key Features

	* Real-time querying of data using SQL
	* Visual breakdown of sales and profit by region, segment, and category
	* Highlighting top-performing products
	* Insightful KPIs: Average Gross Profit, Profit Margin(%), Sales Volume, Total Profit
	* Interactive filters for drill-down analysis

### SQL Environment

--- "portfolio_projects" is the name to the database i created.

use portfolio_projects;

--- Now lets create the table;

CREATE TABLE Finances (
Segment	VARCHAR(50)	NOT NULL,
Country	VARCHAR(50)	NOT NULL,
Product	VARCHAR(50)	NOT NULL,
Discount_Band	VARCHAR(50)	NOT NULL,
Units_Sold	INT	NOT NULL,
Manufacturing_Price	MONEY	NOT NULL,
Sale_Price	MONEY	NOT NULL,
Gross_Sales	MONEY	NOT NULL,
Discounts	MONEY	NULL,
Sales	MONEY	NOT NULL,
COGS	MONEY	NOT NULL,
Profit	MONEY	NULL,
Date	DATE	NOT NULL,
Month_Number	INT	NOT NULL,
Month_Name	VARCHAR(20)	NOT NULL,
Year	INT	NOT NULL
);

---- Clean & Explore the Data
		----- Check Row Count and Sample Data

SELECT COUNT(*) FROM Finances 

SELECT * FROM Finances

--- Check for Nulls

SELECT 
	COUNT(*) - COUNT(Segment) AS Null_Segment,
	COUNT(*) - COUNT(Country) AS Null_Country,
	COUNT(*) - COUNT(Units_Sold) AS Null_UnitsSold
FROM Finances

--- SQL Queries for Data Analysis

----- Total Sales and Profit

SELECT
	SUM(Sales) as Total_Sales,
	SUM(Profit) AS Total_Profit
FROM Finances;

----- Top 5 Products by Sales

SELECT
	Product,
	SUM(Sales) AS Total_Sales
FROM Finances
GROUP BY Product
ORDER BY Total_Sales DESC;

----- Sales and Profit by Country and Segment

SELECT
	Country,
	Segment,
	SUM(Sales) AS Total_Sales,
	SUM(Profit) AS Total_Profit
FROM Finances
GROUP BY Country, Segment

----- Discount Effect on Profit Margin

SELECT
	Discount_Band,
	AVG(Discounts) AS Avg_Discount,
	AVG(Sales) AS Avg_Sales,
	AVG(Profit) AS Avg_Profit,
	AVG(Profit) / AVG(Sales) AS Profit_Margin
FROM Finances
GROUP BY Discount_Band


----- Sales and Profit by Segment

SELECT
	Segment,
	SUM(Sales) AS Sales,
	SUM(Profit) AS Profit
FROM Finances
GROUP BY Segment
ORDER BY Sales DESC;

----- Total Profit and Sales by Country

SELECT
	Country,
	SUM(Profit) AS Total_Profit,
	SUM(Sales) AS Total_Sales
FROM Finances
GROUP BY Country
ORDER BY Total_Profit

----- Profit Margin by Segment

SELECT 
	Segment,
	ROUND(SUM(Profit) / NULLIF(SUM(Sales), 0), 2) AS Profit_Margin
FROM Finances
GROUP BY Segment
ORDER BY Profit_Margin DESC;

----- Average Discount Rate by Discount Band

SELECT
	Discount_Band,
	ROUND(AVG(Discounts / NULLIF(Gross_Sales, 0)), 2) AS Avg_Discount_Rate
FROM Finances
GROUP BY Discount_Band
ORDER BY Avg_Discount_Rate DESC;

----- Most and Least Profitable Products

-- Most

SELECT
	Product,
	SUM(Profit) AS Total_Profit
FROM Finances
GROUP BY Product
ORDER BY Total_Profit DESC;

-- Least

SELECT
	Product,
	SUM(Profit) AS Total_Profit
FROM Finances
GROUP BY Product
ORDER BY Total_Profit;

----- Sales v/s Discounts by Country

SELECT
	Country,
	SUM(Sales) AS Total_Sales,
	SUM(Discounts) AS Total_Discounts,
	ROUND(SUM(DIscounts)/NULLIF(SUM(Sales), 0), 2) AS Discount_to_Sales_Ratio
FROM Finances
GROUP BY Country
ORDER BY Discount_to_Sales_Ratio DESC;

### Power BI Environment

	1) Business Questions

		a) Sales & Revenue Focus

	* What are the total sales, units sold, and profit this year ?
	* Which countries perform best in terms of sales and profit ?
	* How does sales performance change over time (monthly) ?
	* What are the top 5 products by revenue ?

		b) Profitability and Margins

	* Which segments or products yield the highest profit margins ?

		c) Discount & Pricing Impact

	* Does applying discount improve or hurt overall profitability ?
	* How does the discount band affect profit margin ?

	2) Data Cleaning and Modelling

		a) Transformations:

	* Ensure numeric types are correct (e.g Sales, Profit as decimals)

		b) New Columns

	* Gross Margin % = DIVIDE([Profit], [Sales])
	* Profit per Unit = DIVIDE([Profit], [Units Sold])
	* Discount Rate = DIVIDE([Discounts], [Gross Sales])

	3) Key DAX Measures

	* Total Sales = SUM('Financial Sample'[Sales])
	* Total Profit = SUM('Financial Sample'[Profit])
	* Total Units = SUM('Financial Sample'[Units Sold])
	* Average Gross Margin = AVERAGE('Financial Sample'[Profit]) / AVERAGE('Financial Sample'[Sales])
	* Profit Margin % = DIVIDE([Total Profit], [Total Sales])
	* Top Product = CALCULATE(MAX('Financial Sample'[Product]), TOPN(1, 'Financial Sample', 'Financial Sample'[Sales]))

	4) Dashboard Pages & Visuals

		Page 1: Executive Overview

	* Cards: Total Sales, Total Profit, Profit Margin %, Top Product
	* Slicer: Year, Segment
	* Map: Sales by Country
	* Pie/Bar: Sales by Segment


		Page 2: Sales & Time Analysis

	* Line Chart: Sales over Month
	* Column Chart: Sales by Year
	* Area Chart: Sales by Segment over time


		Page 3: Profitability Deep Dive

	* Bar Chart: Profit by Product
	* Table: Region, Product, Profit Margin %
	* Scatter: Sales vs Profit


		Page 4: Discount Analysis

	* Matrix: Discount Band vs Segment
	* Bar Chart: Discounts vs Profit
	* KPI Card: Average Discount Rate

### Good luck and reach out.
### Check medium for explained work.
