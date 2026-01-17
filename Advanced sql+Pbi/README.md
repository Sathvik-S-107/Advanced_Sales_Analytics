# Advanced Sales Analytics (PostgreSQL & Power BI)

## Project Overview
An end-to-end sales analytics project using PostgreSQL and Power BI to analyze revenue, customers, and product performance and present insights through interactive dashboards.

---

## Tools Used
- PostgreSQL
- Power BI
- DAX

---

## Dataset
- Customers data: customer demographics, city, and segment
- Sales data: transactional sales records with product, category, quantity, and price

---

## SQL Concepts & Functions Used

- Table creation with primary and foreign keys
- INNER JOIN to combine sales and customer data
- Aggregation using SUM, COUNT, and AVG
- GROUP BY and HAVING for grouped analysis
- DATE_TRUNC for monthly revenue analysis
- ORDER BY and LIMIT for top-N analysis
- Window functions (RANK) for product and customer ranking
- Subqueries for segment-level insights

---

## Business Questions Solved Using SQL

- Total revenue and total orders
- Revenue by product category and city
- Customer-wise and segment-wise revenue contribution
- Monthly revenue trend
- Top customers and top products by revenue
- Customer lifetime value

---

## DAX Measures & Concepts Used

- Calculated measures for business KPIs (Total Revenue, Total Orders, Average Order Value)
- Iterator functions (SUMX) for row-level calculations
- DIVIDE for safe mathematical operations
- Filter context and dynamic recalculation using slicers
- Ranking using RANKX
- Time intelligence using CALCULATE and date functions

---

## Power BI Dashboards

### Sales Overview
- KPI cards for revenue, orders, and AOV
- Segment-wise revenue distribution
- Revenue trend over time

### Customer Analysis
- Customer revenue ranking
- Segment and city-level filtering

### Product Performance
- Category-wise and product-wise revenue analysis

---

## Key Learnings
- Designed a relational data model using PostgreSQL
- Applied SQL analytics for business insights
- Used DAX to implement custom business logic
- Built interactive and dynamic dashboards in Power BI
