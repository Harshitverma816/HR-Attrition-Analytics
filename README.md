HR Attrition Analytics – End-to-End Data Analytics Project

📌 Overview
This project analyzes employee attrition using the IBM HR dataset. The goal is to identify the key factors that drive employees to leave, understand workforce behavior, and support HR teams with insights for improving retention.
The project includes Python EDA, SQL analysis, Power BI dashboard development, and a complete end-to-end workflow suitable for real-world HR analytics.

📌 Dataset
Source: IBM HR Attrition Dataset
Rows: 1470
Columns: 13

Key fields include:
- Age, Attrition, Department
- MonthlyIncome, YearsAtCompany
- JobSatisfaction, EnvironmentSatisfaction
- WorkLifeBalance
- Education, EducationField
- MaritalStatus
- NumCompaniesWorked

📌 Tools & Technologies
- Python: Pandas, NumPy, Matplotlib, Seaborn
- SQL: MySQL for workforce insights
- Power BI: Multi-page interactive dashboard

📌 Project Workflow
1. Data Understanding & Preparation
- Loaded dataset in Python
- Cleaned missing / inconsistent values
- Feature engineering:
   - AgeGroup
   - IncomeBand
   - TenureGroup
   - SatisfactionScore
   - AttritionFlag
2. Exploratory Data Analysis (EDA)
Performed visual and statistical exploration:
- Attrition distribution
- Salary & tenure patterns
- Satisfaction analysis
- Correlation study
- Demographic breakdown
3. SQL Analysis
Built SQL queries for:
- Attrition rate calculation
- Department-wise attrition
- Income and satisfaction-based segmentation
- Tenure and experience insights
- High-risk employee identification
4. Power BI Dashboard
Created a 3-page dashboard with navigation buttons:
- Page 1: HR Summary
  KPIs, attrition by department, satisfaction comparison
- Page 2: Compensation & Experience
  Income distribution, tenure vs salary, job experience patterns
- Page 3: Satisfaction & Risk Segments
  Satisfaction gauge, matrix views, high-risk employee table

📌 Key Insights
- Overall attrition rate: 16.12%
- Highest attrition found in Sales and R&D departments
- Lower-income employees show significantly higher attrition
- Early-tenure employees (0–3 years) are the most vulnerable
- Employees with lower satisfaction scores are more likely to leave
- Prior job-hopping (NumCompaniesWorked) correlates with attrition risk

📌 Recommendations
- Review compensation structure for lower salary bands
- Strengthen onboarding experience to reduce early attrition
- Improve satisfaction drivers: work-life balance, job enrichment
- Department-specific retention plans for Sales and R&D
- Implement proactive high-risk employee monitoring

📌 Conclusion

This project provides a full data analytics workflow that reveals meaningful insights into why employees leave and how organizations can improve retention. The Power BI dashboard offers actionable visualizations that HR teams can use for decision-making.

📌 How to Run

1. Clone the repository
2. Install Python libraries:
     pip install -r requirements.txt
4. Run EDA notebook
5. Import cleaned dataset into MySQL
6. Open Power BI file and refresh the data model
