--Duplicate Ids Check 
SELECT ID, COUNT(*) AS Duplicate_Count
FROM Future500
GROUP BY ID
HAVING COUNT(*) > 1 

--Duplicate Records Remove 
WITH CTE AS
(SELECT *,ROW_NUMBER() OVER(PARTITION BY ID ORDER BY ID) AS rn
 FROM Future500)
DELETE FROM CTE
WHERE rn > 1

--3. NULL Values Check
SELECT
SUM(CASE WHEN Industry IS NULL then 1 else 0 END) AS Industry_Nulls,
SUM(CASE WHEN Inception IS NULL then 1 else 0 END) AS Inception_Nulls,
SUM(CASE WHEN Employees IS NULL then 1 else 0 end) AS Employees_Nulls,
SUM(CASE WHEN State IS NULL then 1 else 0 END) AS State_Nulls,
SUM(CASE WHEN Revenue IS NULL then 1 else 0 END) AS Revenue_Nulls,
SUM(CASE WHEN Profit IS NULL then 1 else 0 END) AS Profit_Nulls
FROM Future500 
--Revenue Analysis
SELECT SUM(Revenue) AS Total_Revenue
FROM Future500 
--Profit Analysis
SELECT SUM(Profit) AS Total_Profit
FROM Future500

--Top Revenue Companies

SELECT TOP 10 Name, Revenue
FROM Future500
ORDER BY Revenue DESC

--Top Profit Companies

SELECT TOP 10 Name, Profit
FROM Future500
ORDER BY Profit DESC

--Industry-wise Analysis

SELECT Industry,SUM(Revenue) AS Revenue,SUM(Profit) AS Profit
FROM Future500
GROUP BY Industry;

--State-wise Analysis

SELECT State,SUM(Revenue) AS Revenue
FROM Future500
GROUP BY State

--Employee Analysis
SELECT AVG(Employees) AS Avg_Employees
FROM Future500