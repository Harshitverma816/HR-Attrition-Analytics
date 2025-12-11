-- HR Attrition Data Analysis SQL Queries

-- 1. Total employees, total attrition & attrition rate
SELECT 
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS total_attrition,
    ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS attrition_rate
FROM hr_attrition;

-- 2. Attrition by department
SELECT 
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_attrition
GROUP BY Department
ORDER BY attrition_rate DESC;

-- 3. Average salary by department
SELECT 
    Department,
    AVG(MonthlyIncome) AS avg_income
FROM hr_attrition
GROUP BY Department
ORDER BY avg_income DESC;

-- 4. Average income of employees with attrition
SELECT 
    Attrition,
    AVG(MonthlyIncome) AS avg_income
FROM hr_attrition
GROUP BY Attrition;

-- 5. Attrition by YearsAtCompany group
SELECT 
    CASE 
        WHEN YearsAtCompany <= 1 THEN '0-1 yrs'
        WHEN YearsAtCompany BETWEEN 2 AND 3 THEN '2-3 yrs'
        WHEN YearsAtCompany BETWEEN 4 AND 7 THEN '4-7 yrs'
        WHEN YearsAtCompany BETWEEN 8 AND 15 THEN '8-15 yrs'
        ELSE '15+ yrs'
    END AS tenure_group,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count
FROM hr_attrition
GROUP BY tenure_group;

-- 6. Average total companies worked vs attrition
SELECT 
    Attrition,
    AVG(NumCompaniesWorked) AS avg_companies_worked
FROM hr_attrition
GROUP BY Attrition;

-- 7. Average job, environment & work-life satisfaction by attrition
SELECT 
    Attrition,
    AVG(JobSatisfaction) AS avg_job_satisfaction,
    AVG(EnvironmentSatisfaction) AS avg_environment_satisfaction,
    AVG(WorkLifeBalance) AS avg_work_life_balance
FROM hr_attrition
GROUP BY Attrition;


-- 8. Employees with low satisfaction (risk group)
SELECT *
FROM hr_attrition
WHERE JobSatisfaction <= 2
   OR EnvironmentSatisfaction <= 2
   OR WorkLifeBalance <= 2;

-- 9. Attrition by education field
SELECT 
    EducationField,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_attrition
GROUP BY EducationField
ORDER BY attrition_rate DESC;

-- 10. Attrition by marital status
SELECT 
    MaritalStatus,
    COUNT(*) AS total,
    SUM(CASE WHEN Attrition='Yes' THEN 1 END) AS attrition_count,
    ROUND(SUM(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_attrition
GROUP BY MaritalStatus;

-- 11. Identify high-attrition departments (>20%)
WITH dept_attrition AS (
    SELECT 
        Department,
        SUM(CASE WHEN Attrition='Yes' THEN 1 END)*100.0/COUNT(*) AS attrition_rate
    FROM hr_attrition
    GROUP BY Department
)
SELECT *
FROM dept_attrition
WHERE attrition_rate > 20;

-- 12. Compare satisfaction of attrition vs non-attrition groups
WITH sat AS (
    SELECT 
        Attrition,
        AVG(JobSatisfaction) AS avg_job,
        AVG(EnvironmentSatisfaction) AS avg_env,
        AVG(WorkLifeBalance) AS avg_wlb
    FROM hr_attrition
    GROUP BY Attrition
)
SELECT * FROM sat;

-- 13. High risk employees
-- Low salary + low satisfaction + short tenure.
SELECT *
FROM hr_attrition
WHERE MonthlyIncome < (SELECT AVG(MonthlyIncome) FROM hr_attrition)
  AND JobSatisfaction <= 2
  AND YearsAtCompany <= 2;
