CREATE DATABASE amex_project;
USE amex_project;
SELECT COUNT(*) FROM bankchurners;
RENAME TABLE bankchurners TO customers;

SELECT Card_Category,
       COUNT(*) AS customers,
       SUM(Attrition_Flag = 'Attrited Customer') AS churned,
       ROUND(100 * AVG(Attrition_Flag = 'Attrited Customer'), 2) AS churn_rate_pct
FROM customers
GROUP BY Card_Category
ORDER BY churn_rate_pct DESC;

SELECT Attrition_Flag,
       COUNT(*) AS customers,
       ROUND(AVG(Credit_Limit), 0) AS avg_credit_limit,
       ROUND(AVG(Avg_Utilization_Ratio), 3) AS avg_utilization,
       ROUND(AVG(Total_Trans_Ct), 1) AS avg_transactions
FROM customers
GROUP BY Attrition_Flag;

SELECT CASE
         WHEN Avg_Utilization_Ratio < 0.1 THEN '1. Low (<10%)'
         WHEN Avg_Utilization_Ratio < 0.5 THEN '2. Medium (10-50%)'
         ELSE '3. High (50%+)'
       END AS utilization_band,
       COUNT(*) AS customers,
       ROUND(100 * AVG(Attrition_Flag = 'Attrited Customer'), 2) AS churn_rate_pct
FROM customers
GROUP BY utilization_band
ORDER BY utilization_band;

SELECT Income_Category,
       ROUND(AVG(Credit_Limit), 0) AS avg_credit_limit,
       ROUND(100 * AVG(Attrition_Flag = 'Attrited Customer'), 2) AS churn_rate_pct
FROM customers
WHERE Income_Category <> 'Unknown'
GROUP BY Income_Category
ORDER BY avg_credit_limit DESC;

SELECT COUNT(*) AS candidates,
       ROUND(AVG(Credit_Limit), 0) AS avg_credit_limit,
       ROUND(AVG(Avg_Utilization_Ratio), 3) AS avg_utilization,
       ROUND(AVG(Total_Trans_Ct), 1) AS avg_transactions
FROM customers
WHERE Attrition_Flag = 'Existing Customer'
  AND Avg_Utilization_Ratio > 0.5
  AND Credit_Limit < 5000
  AND Total_Trans_Ct >= 60
  AND Months_Inactive_12_mon <= 2;
  
SELECT Months_Inactive_12_mon,
       COUNT(*) AS customers,
       ROUND(100 * AVG(Attrition_Flag = 'Attrited Customer'), 2) AS churn_rate_pct
FROM customers
GROUP BY Months_Inactive_12_mon
ORDER BY Months_Inactive_12_mon;