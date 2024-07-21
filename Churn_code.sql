-- See the full dataset
SELECT * FROM churn_modelling;

-- Total customer
SELECT COUNT(*) as customers_total
FROM churn_modelling; 

-- 10000 customers, how # have churned
SELECT COUNT(*) as total_churned
FROM churn_modelling
WHERE exited = 1;

-- % churn rate, ROUND to reduce decimals
SELECT
	ROUND((COUNT(*)*100)/(SELECT COUNT(*) FROM churn_modelling),2) as rate_churn
FROM churn_modelling
WHERE exited = 1;

-- customers by country
SELECT geography, COUNT(*) as total_customers
FROM churn_modelling
GROUP BY geography;

-- churned by country
SELECT geography, COUNT(*) as total_churned
FROM churn_modelling
WHERE exited = 1
GROUP BY geography;

-- assess churn rate with factor
-- churn rate by gender
SELECT gender,
	ROUND((SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100/ COUNT(*)),2) as churn_rate
FROM churn_modelling
GROUP BY gender;

-- by age
SELECT age, 
	ROUND((SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100/ COUNT(*)),2) as churn_rate
FROM churn_modelling
GROUP BY age;

-- age group
SELECT 
	CASE
		WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30 - 50'
        ELSE 'Over 50'
	END AS age_grp,
  ROUND((SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100/ COUNT(*)),2) as churn_rate
FROM churn_modelling
GROUP BY age_grp;

-- tenure
SELECT Tenure,
	ROUND((SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100/ COUNT(*)),2) as churn_rate
FROM churn_modelling
GROUP BY Tenure;

-- by active members
SELECT IsActiveMember,
	ROUND((SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100/ COUNT(*)),2) as churn_rate
FROM churn_modelling
GROUP BY IsActiveMember;

-- by # products
SELECT NumOfProducts,
	ROUND((SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100/ COUNT(*)),2) as churn_rate
FROM churn_modelling
GROUP BY NumOfProducts;

SELECT 
	CASE
		WHEN HasCrCard = 1 THEN 'Yes'
        ELSE 'No'
        END AS Has_cr_card,
		ROUND((SUM(CASE WHEN exited = 1 THEN 1 ELSE 0 END) * 100/ COUNT(*)),2) as churn_rate
FROM churn_modelling
GROUP BY Has_cr_card;
	
-- avg customer age
SELECT ROUND(AVG(age),1)
FROM churn_modelling;
    
-- avg # products cust had
SELECT AVG(NumOfProducts)
FROM churn_modelling;

-- avg credit score
SELECT AVG(CreditScore)
FROM churn_modelling;

-- avg balance
SELECT AVG(Balance)
FROM churn_modelling;

-- avg salary
SELECT AVG(EstimatedSalary)
FROM churn_modelling;




