use portfolio_projects

--- create mobile money table

CREATE TABLE mobile_money (
Year	INT	NOT NULL,
Month	VARCHAR(30)	NOT NULL,
Active_Agents	FLOAT	NOT NULL,
Total_Registered_Mobile_Money_Accounts_Millions	FLOAT	NOT NULL,
Total_Agent_Cash_in_Cash_Out_Volume_Million	FLOAT	NOT NULL,
Total_Agent_Cash_in_Cash_Out_Value_KSh_billions	FLOAT NOT NULL
)


SELECT * FROM mobile_money

--------------------------------- SQL Queries

--- Total growth in mobile money accounts

SELECT
	MIN(Date) AS Start_Date,
	MAX(Date) AS End_Date,
	MAX(Total_Registered_Mobile_Money_Accounts_Millions) - MIN(Total_Registered_Mobile_Money_Accounts_Millions) AS Growth
FROM mobile_money;

--- Average Cash Value per Account(Millions) over Time

SELECT
	Date,
	ROUND(AVG(Total_Agent_Cash_in_Cash_Out_Volume_Million), 2) AS Avg_Cash_Value_Per_Account
FROM mobile_money
GROUP BY Date
ORDER BY Date

--- Agent coverage trend

SELECT
	Date,
	Active_Agents
FROM mobile_money
ORDER BY Date
