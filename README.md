# ♾️ Infinity Collection — Business Intelligence Project

<p align="center">
  <img src="docs/logo.png" alt="Infinity Collection Logo" width="200"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Python-3.10+-blue?logo=python&logoColor=white"/>
  <img src="https://img.shields.io/badge/PostgreSQL-15-blue?logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Power%20BI-Dashboard-yellow?logo=powerbi"/>
  <img src="https://img.shields.io/badge/Excel-Advanced-green?logo=microsoftexcel"/>
  <img src="https://img.shields.io/badge/Status-Active-brightgreen"/>
  <img src="https://img.shields.io/badge/UDYAM-MH--01--0056563-orange"/>
</p>

---

## 🏢 About the Business

**Infinity Collection** is a B2B wholesale & retail footwear distribution business based in **Shirdi, Ahmednagar, Maharashtra**.

| Field | Details |
|---|---|
| **Proprietor** | Shubham Zarekar |
| **Co-Proprietor** | Vilas Zarekar |
| **UDYAM No.** | UDYAM-MH-01-0056563 |
| **Type** | Micro Enterprise (MSME) |
| **NIC Code** | 47713 — Retail Sale of Footwear |
| **Established** | August 2021 |
| **Location** | Shirdi, Ahmednagar — 423109 |
| **Contact** | 8625891765 / infinitycollection007@gmail.com |

### 📦 Products
- Kolhapuri Chappal, Jaipuri Mojari, Ahmedabad Chappal
- Fancy Shoes & Slippers, Jutt Bags, Art Belts & Pockets
- Teddy Bear soft toys, Designer Accessories

---

## 📊 Project Overview

This repository contains a complete **Data Analytics & Business Intelligence** project for Infinity Collection, covering:

- **2 years** of monthly sales data (2024 & 2025)
- **47+ customer** ledger with outstanding receivables
- **11 supplier** payable analysis
- Full year-over-year performance comparison
- Business timeline with impact analysis (COVID, Accident)

### 🏆 Business Milestones
```
2021 ──── Business Founded (3 shops)
2022 ──── Network grew to 50+ shops
2023 ──── Peak: ₹1.5 Cr annual turnover | 150+ retail partners
2024 ──── Strong year: ₹1.44 Cr sell | ₹1.42 Cr collection
Dec 2024 ─ Owner road accident ⚠️
2025 ──── Recovery phase (-39% YoY) | Father managed operations
2025+ ──── Owner returning | Career pivot to Data Analytics
```

---

## 📁 Repository Structure

```
infinity-collection/
│
├── 📊 data/
│   ├── monthly_sales.csv          # 2024-2025 monthly sales (24 records)
│   ├── customers.csv              # Customer ledger & balances
│   └── suppliers.csv             # Supplier payable list
│
├── 🐘 sql/
│   └── infinity_collection_schema.sql   # Full PostgreSQL schema + 10 queries + 2 views
│
├── 🐍 python/
│   └── analysis.py               # pandas + matplotlib + seaborn analysis
│
├── 📄 docs/
│   ├── dashboard.png             # Auto-generated Python dashboard
│   ├── powerbi_guide.md          # Power BI setup instructions
│   └── github_guide.md           # GitHub upload guide
│
├── 📗 Infinity_Collection_BI_Report.xlsx   # Main Excel BI Report (7 sheets)
│
└── 📖 README.md
```

---

## 🔑 Key Metrics

### 📅 2024 Performance
| Metric | Value |
|---|---|
| Total Collection | ₹1,42,40,854 |
| Total Sell | ₹1,44,04,717 |
| Net Difference | ₹+2,63,863 |
| Best Month (Sell) | January (₹16,06,703) |
| Avg Monthly Sell | ₹12,00,393 |

### 📅 2025 Performance
| Metric | Value |
|---|---|
| Total Collection | ₹86,25,664 |
| Total Sell | ₹87,30,875 |
| Net Difference | ₹+1,05,211 |
| YoY Change | **-39.8%** ⚠️ |
| Best Month (Sell) | January (₹14,93,496) |

### 💰 Financial Position
| Item | Amount |
|---|---|
| Total Customer Receivable | ₹9,83,271+ |
| Total Supplier Payable | ₹7,44,115 |
| Net Working Capital | ₹+2,39,156 |

---

## 🛠️ Tools & Technologies

| Tool | Usage |
|---|---|
| **Python (pandas)** | Data loading, cleaning, transformation |
| **Python (matplotlib/seaborn)** | Data visualization, charts |
| **PostgreSQL** | Database schema, analytical SQL queries |
| **Microsoft Excel (Advanced)** | Pivot tables, charts, KPI dashboards |
| **Power BI** | Interactive BI dashboard (see `/docs/powerbi_guide.md`) |
| **Git & GitHub** | Version control, portfolio hosting |

---

## 🐘 SQL Highlights (PostgreSQL)

The SQL script includes:

```sql
-- 10 analytical queries covering:
-- Q1: Annual Revenue Summary
-- Q2: Month-over-Month Growth (with LAG window function)
-- Q3: Year-on-Year Comparison
-- Q4: Ranking Best/Worst Months (with RANK())
-- Q5: Quarterly Seasonal Analysis
-- Q6: Business Impact Analysis (Pre vs Post Accident)
-- Q7: Customer vs Supplier Outstanding
-- Q8: Top 10 Customers (with priority classification)
-- Q9: Cumulative Running Total (SUM OVER)
-- Q10: Business Health Score (Custom KPI)

-- 2 Views for Power BI / Reporting:
-- v_monthly_dashboard
-- v_customer_segments
```

---

## 🐍 Python Analysis Features

```python
# What analysis.py does:
✅ Load & clean 2024/2025 sales data
✅ Calculate derived metrics (difference, %, lakhs)
✅ Generate 6-chart dashboard (matplotlib)
✅ Quarterly seasonal analysis
✅ Customer segmentation (A/B/C/D tiers)
✅ YoY impact analysis
✅ Export clean CSVs for Power BI
```

---

## 📈 Dashboard Preview

> Auto-generated Python Dashboard (see `docs/dashboard.png`)

Charts included:
- 📊 Bar Chart: 2024 Monthly Collection vs Sell
- 📊 Bar Chart: 2025 Monthly Collection vs Sell (with accident marker)
- 📈 Line Chart: 2024 vs 2025 YoY Sell comparison (with gap fill)
- 👥 Horizontal Bar: Top 10 Customer Outstanding
- 🏭 Horizontal Bar: Supplier Payables urgency
- 📊 KPI Cards: Key business metrics

---

## ⚙️ How to Run

### Python Analysis
```bash
# Clone the repo
git clone https://github.com/shubhamzarekar01/infinity-collection.git
cd infinity-collection

# Install dependencies
pip install pandas numpy matplotlib seaborn openpyxl

# Run analysis
python python/analysis.py
```

### PostgreSQL Setup
```bash
# Create database
psql -U postgres -c "CREATE DATABASE infinity_collection;"

# Run schema & data
psql -U postgres -d infinity_collection -f sql/infinity_collection_schema.sql

# Run a query
psql -U postgres -d infinity_collection -c "SELECT * FROM v_monthly_dashboard;"
```

---

## 📖 About the Analyst

**Shubham Zarekar** — Mechanical Engineer turned Data Analyst

After building Infinity Collection from 3 shops to 150+ partners and ₹1.5 Cr annual turnover, I am now leveraging my hands-on business experience with data analytics skills.

- 🎓 B.E. Mechanical — SPPU (2019) | Diploma — MSBTE (2013)
- 💼 Ex: Application Sales Engineer | Mechanical Sales Engineer | Design Engineer
- 📊 Skills: Advanced Excel, SQL, Python, Power BI, Data Visualization
- 🔗 LinkedIn: [linkedin.com/in/shubhamzarekar1997](https://linkedin.com/in/shubhamzarekar1997)
- 📧 Email: shubhamzarekar01@gmail.com | infinitycollection007@gmail.com

---

## 📜 License

This project and its data are proprietary to **Infinity Collection**.  
For educational/portfolio demonstration purposes only.

---

<p align="center">
  Made with ❤️ by Shubham Zarekar | Shirdi, Maharashtra, India
</p>
