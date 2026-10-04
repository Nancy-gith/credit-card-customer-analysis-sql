# Credit Card Customer Analysis (SQL)

Analysis of 10,127 credit card customers in MySQL to understand **what drives churn** and **which customers are good candidates for a credit line increase**.

## Business Questions
1. Which card types have the highest churn?
2. How do churned customers differ from retained ones?
3. Does card usage (utilization) predict churn?
4. How do credit limit and churn vary by income group?
5. Which active customers are strong candidates for a credit line increase?
6. Does inactivity predict churn?

## Dataset
[Credit Card Customers (Kaggle)](https://www.kaggle.com/datasets/sakshigoyal7/credit-card-customers): 10,127 customers with credit limit, utilization, transaction activity, income, card type, and churn status.

## Key Findings
- **Churn is about disengagement, not credit limit.** Churned customers had almost the same average limit as retained ones (8,136 vs 8,727) but much lower utilization (0.16 vs 0.30) and ~35% fewer transactions.
- **Low usage is the strongest warning sign.** Customers using less than 10% of their limit churn at 26.5%, nearly 3x the rate of medium and high users (~9%).
- **Inactivity drives churn.** Churn rises from 4.5% at 1 month inactive to 30% at 4 months inactive.
- **Higher limits don't guarantee loyalty.** Average limit rises ~5x from the lowest to highest income group, but churn is highest at both ends (~17%) and lowest in the $60K–$80K group (13.5%).
- **Blue cards are where retention matters most.** Platinum shows the highest churn rate (25%) but has only 20 customers; Blue makes up 93% of customers and 1,519 of 1,627 churners.
- **907 line increase candidates identified.** Active customers with high utilization (67% avg), low limits (~2.5k avg) and above-average spending (78 vs 69 transactions). Since high-utilization customers churn least, a line increase is a low-churn way to grow their spend.

## Recommendations
- Flag customers whose utilization drops below 10% or who go 3+ months inactive for early retention outreach.
- Prioritise retention efforts on the Blue card segment.
- Review the 907 candidates for proactive line increases, subject to a credit-risk check.

## Limitations
- The dataset has no repayment or default history, so line increase candidates would need a credit-risk review before any action.
- Some segments (Platinum cards, 0 and 5–6 months inactive) are too small for reliable conclusions.

## SQL Concepts Used
`GROUP BY`, aggregate functions (`COUNT`, `SUM`, `AVG`), `CASE` for segmentation, `WHERE` filtering, `ORDER BY`

## How to Run
1. Download `BankChurners.csv` from the Kaggle link above.
2. Import it into MySQL as a table named `customers`.
3. Run the queries in `credit_card_customer_analysis.sql`.
