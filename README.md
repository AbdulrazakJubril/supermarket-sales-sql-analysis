# 🛒 Supermarket Sales Analysis Using SQL

## 📌 Project Overview
This project analyzes a supermarket's transactional dataset using SQL. It extracts insights across sales performance, customer behavior, time trends, branch operations, and payment preferences. The goal is to derive data-driven strategies to improve revenue, operational efficiency, and customer satisfaction.

---

## 📂 Dataset Description
The dataset includes:
- **Transaction Details:** invoice ID, time, date, quantity, unit price, tax, total.
- **Customer Info:** gender, customer type (Member or Normal).
- **Store Data:** branch, city.
- **Product Details:** product line/category.
- **Payment Details:** method of payment.
- **Customer Feedback:** rating.

---

## 🎯 Analysis Themes and Key Insights

### A. Sales Performance
- 🥇 **Top Revenue Product Line:**  
  Identified the highest-earning product category using `SUM(total)` and `SUM(gross_income)`.

- 📊 **Average Sales & Profit per Transaction:**  
  Used `AVG(total)` and `AVG(gross_income)` to measure transaction profitability.

### B. Customer Behavior
- 👥 **Customer Type Spending Patterns:**  
  Compared average spending between Members and Normal customers.

- ⚧ **Gender-Based Analysis:**  
  Analyzed who buys and spends more between male and female customers.

### C. Branch & Location Analysis
- 🏬 **Top Performing Branch:**  
  Assessed total revenue and profit per branch using `GROUP BY`.

- 📍 **Customer Satisfaction by Location:**  
  Evaluated average customer ratings across cities and branches.

### D. Product Line Performance
- 🛍️ **Top 3 Product Lines by Quantity & Revenue:**  
  Identified most popular and profitable categories.

- 💰 **Product Line with Highest Avg Profit & Rating:**  
  Combined profitability and customer satisfaction metrics.

### E. Time-Based Sales Trends
- 📆 **Peak Sales Days:**  
  Extracted weekday names using `FORMAT(date, 'dddd')`.

- ⏰ **Peak Shopping Hours:**  
  Analyzed hourly trends via `FORMAT(time, 'hh')`.

- ⌚ **Branch-specific Peak Hours:**  
  Grouped sales data by branch and hour.

### F. Payment Insights
- 💳 **Most Used Payment Method:**  
  Identified top payment type and its average transaction value.

- 🏦 **Branch-wise Payment Averages:**  
  Compared performance of payment methods per branch.

### G. Operational Metrics
- 📦 **Avg Quantity per Product Line:**  
  Analyzed bulk purchase behavior per category.

- 💹 **Profitability by Day:**  
  Used `AVG(gross_income)` grouped by weekday to spot high-profit days.

---

## 🛠️ SQL Concepts Used
- **Aggregate Functions:** `SUM()`, `AVG()`, `COUNT()`, `ROUND()`
- **Date & Time Functions:** `FORMAT(date, 'dddd')`, `FORMAT(time, 'hh')`
- **Grouping and Filtering:** `GROUP BY`, `ORDER BY`, `TOP`

---

## 📈 Tools
- **Database:** SQL Server   
- **IDE:** SQL Server Management Studio
- **Optional Visualization:** Power BI 

---

## 🧠 Key Takeaways
- Product lines like *Health and Beauty* drive significant revenue.
- Evenings and weekends are peak transaction periods.
- E-wallets are the most preferred payment method.
- Member customers tend to spend more per transaction.
- Branch B shows the highest average profit.

---

## ✅ Next Steps
- Develop a BI dashboard to visualize insights.
- Conduct cohort or RFM analysis for customer segmentation.
- Perform predictive modeling on future sales patterns.

---

## 👤 Author
**[Abdulrazak Jubril]**  
Aspiring Data Analyst | SQL Enthusiast | Educator

[🔗in Abdulrazak Jubril](#)  • [📧 abdulrazakJubril52@gmail.com](#)

---

> *“Turning raw data into real decisions.”*
