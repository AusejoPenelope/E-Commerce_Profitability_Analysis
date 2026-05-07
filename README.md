# 🌐 E‑Commerce Profitability Analysis

![SQL Badge](https://img.shields.io/badge/SQL-Analysis-blue)
![Tableau Badge](https://img.shields.io/badge/Tableau-Dashboard-orange)
![GitHub Badge](https://img.shields.io/badge/GitHub-Repository-black)

## 🎯 1. Project Goal
Analyze e‑commerce profitability across product categories, sales channels, returns, and marketing spend to identify where the business makes and loses money — and provide data‑driven recommendations to improve margins.

## ❓ 2. Key Business Questions
This analysis focuses on answering the following strategic questions to understand profitability drivers and operational inefficiencies:

1. **What is the average profit margin by product category?**  
   - Which categories are most and least profitable?  
   - Are differences driven by product cost, shipping, discounts, or returns?

2. **How does profitability differ across sales channels?**  
   - Website, Mobile App, Marketplace, Social Commerce  
   - Which channel has the best and worst profit per order?

3. **What is the return rate by category and channel?**  
   - How much total revenue was lost to returns?

4. **Which marketing platforms deliver the best ROAS?**  
   - Are there platforms where spend does not generate positive return?

5. **If the CEO asked to cut 20% of the marketing budget:**  
   - Which platforms and months should be reduced?  
   - What data supports this recommendation?

## 📂 3. Data Sources
- 📄 orders.csv  
- 📄 marketing_spend.csv  
- 📄 products.csv  

## 🛠️ 4. Tools Used
- 🧮 SQL (analysis)  
- 📊 Excel (validation)  
- 📈 Tableau (visualizations)  
- 🗂️ GitHub (project hosting)  

## 🔍 5. Analysis Steps
**1. Data Import & Initial Inspection**  
Loaded all datasets and reviewed structure, missing values, and data types.

**2. Data Cleaning in SQL**  
Standardized column names, fixed inconsistencies, removed unused fields, and created a cleaned table.

**3. Data Validation**  
Verified joins, row counts, date formats, and profit/return calculations.

**4. SQL Analysis**  
Calculated profit, margins, return rates, revenue loss, and channel profitability.

**5. Preparing Data for Tableau**  
Exported cleaned tables and ensured fields were ready for visualization.

**6. Building the Tableau Dashboard**  
Created visualizations for profit, returns, channels, and KPIs.

**7. Insights & Recommendations Preparation**  
Reviewed patterns and summarized findings for decision‑making.

## 💡 6. Insights & Recommendations
The following insights summarize the key patterns uncovered during the analysis and form the basis for the recommendations that follow.

### 🔸 Insights
**Insight 1 — Profit by Category**  
Some categories consistently generate higher profit margins, while others underperform despite similar sales volumes.

**Insight 2 — Profit by Channel**  
Sales channels contribute very differently to overall profitability.

**Insight 3 — Return Rate Impact**  
High return rates significantly reduce net revenue and profit.

**Insight 4 — Return Rate by Category**  
Some categories show disproportionately high return rates relative to sales.

**Insight 5 — Profit vs Return Rate (Scatter Plot)**  
A clear negative relationship exists between return rate and profitability.

**Insight 6 — Top Products by Return Rate**  
A small group of products drives a large share of total returns.

**Insight 7 — ROAS Dashboard**  
Email marketing and Facebook Ads have the lowest aggregate ROAS. On the other hand TikTok Ads and Influencers have the highest. 

### 🧭 Recommendations
**Recommendation 1 — Reduce High Return Rates**  
Improve product descriptions, sizing guidance, and quality checks.

**Recommendation 2 — Focus on High‑Margin Categories**  
Increase marketing and inventory support for high‑margin categories.

**Recommendation 3 — Optimize Low‑Margin Channels**  
Review operational costs and return policies.

**Recommendation 4 — Address Underperforming Products**  
Improve imagery, expectations, or redesign problematic items.

**Recommendation 5 — Strengthen Customer Guidance**  
Add clearer sizing charts, fit recommendations, and usage tips.

**Recommendation 6 — Monitor Return Trends Over Time**  
Implement recurring performance reviews.

**Recommendation 7 — 20% budget cut** 
A 20% budget cut can be achieved by reducing the spent amount in low‑ROAS platforms such as Email marketing and Facebook Ads while protecting high‑ROAS platforms such as Tik Tok Ads, Influencers and Instagram.

## 🧾 7. Conclusion
From raw transactional data to actionable business insights, this project shows how data clarifies where value is created — and where it is lost. The analysis highlights opportunities to improve profitability by reducing returns, strengthening high‑performing categories, and optimizing channel strategy. The recommendations translate these insights into practical next steps that support long‑term, data‑driven growth.

## 📊 8. Visualizations
### 📈 Tableau Dashboard: E‑commerce Returns & Profitability
This interactive dashboard provides a consolidated view of profitability, return rates, and sales performance across all channels.

**Key metrics included:**
- 📦 Profit margin by category  
- 🔁 Return rate by category and channel  
- 💸 Revenue lost to returns  
- 🛒 Profitability across sales channels  
- 📌 High‑level KPIs (profit, revenue, returns, return rate)

**Dashboard file:**  
`ecommerce_dashboard.twbx`

**How to open:**  
Download the `.twbx` file and open it in Tableau Public or Tableau Desktop.

## 📬 Contact Me

Let’s connect and talk about data, analytics, or new opportunities:

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Profile-blue)](https://www.linkedin.com/in/penelopeausejo/)
[![GitHub](https://img.shields.io/badge/GitHub-Portfolio-black)](https://github.com/AusejoPenelope)
[![Email](https://img.shields.io/badge/Email-Send%20a%20message-red)](mailto:penelope@bankofwords.com)

Thanks for reading... Have a great day!!!