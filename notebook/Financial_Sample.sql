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

