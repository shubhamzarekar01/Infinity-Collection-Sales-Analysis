# 📊 Power BI Dashboard Setup Guide
## Infinity Collection — Interactive Dashboard

---

## STEP 1: Install Power BI Desktop (Free)
- Go to: https://powerbi.microsoft.com/desktop
- Click **"Download Free"** → Install
- Sign in with any Microsoft/Outlook account (free)

---

## STEP 2: Load Data

1. Open Power BI Desktop
2. Click **"Get Data"** → **"Text/CSV"**
3. Load these files one by one:
   - `data/monthly_sales.csv`
   - `data/customers.csv`
   - `data/suppliers.csv`

---

## STEP 3: Create Relationships (Data Model)
*(In Power BI → Model View)*

No joins needed for these CSVs — they are independent tables.

---

## STEP 4: Create Calculated Columns (DAX)

In monthly_sales table, add:
```dax
Difference = monthly_sales[sell] - monthly_sales[collection]

Diff_Pct = DIVIDE([Difference], [collection], 0)

YoY_Sell = 
VAR CurrentYear = monthly_sales[year]
VAR CurrentMonth = monthly_sales[month_num]
VAR PrevYearSell = CALCULATE(
    SUM(monthly_sales[sell]),
    FILTER(monthly_sales, monthly_sales[year] = CurrentYear - 1 
        && monthly_sales[month_num] = CurrentMonth)
)
RETURN DIVIDE([sell] - PrevYearSell, PrevYearSell, 0)
```

---

## STEP 5: Create Visuals

### Page 1: Sales Overview
| Visual | Type | Fields |
|---|---|---|
| Monthly Sell Bar | Clustered Bar | X: month, Y: sell, Legend: year |
| Monthly Collection Line | Line | X: month, Y: collection, Series: year |
| Annual KPI Cards | Card (×4) | Total Sell 2024, Total Sell 2025, YoY%, Avg Monthly |
| Year Slicer | Slicer | year field |

### Page 2: Customer Analysis
| Visual | Type | Fields |
|---|---|---|
| Top Customers | Bar | Y: name, X: receivable |
| Customer Segments | Donut | Values: receivable, Legend: segment |
| Customer Table | Table | name, area, receivable, segment |

### Page 3: Supplier Payables
| Visual | Type | Fields |
|---|---|---|
| Payable by Supplier | Bar | Y: name, X: payable |
| Urgency Donut | Donut | by payable range |

### Page 4: YoY Comparison
| Visual | Type | Fields |
|---|---|---|
| 2024 vs 2025 Line | Line | Both years on same axis |
| Difference Waterfall | Waterfall | month_name, difference |
| Business Timeline | Text box | Events annotation |

---

## STEP 6: Formatting & Theme

- View → Themes → **"Executive"** or **"Innovation"**
- Add title: **"♾️ Infinity Collection — BI Dashboard"**
- Set background color: **#1A2F5A** (Navy)
- Accent color: **#C9A84C** (Gold)

---

## STEP 7: Publish Online (Free)

1. File → **Publish** → **"To Power BI Service"**
2. Opens in browser: app.powerbi.com
3. Your dashboard is now online!
4. Share the link → add to LinkedIn Featured section

---

## STEP 8: Export Options

- **Export to PDF**: File → Export → Export to PDF
- **Embed in website**: Power BI Service → Share → Embed code
- **Screenshot for GitHub**: Windows + Shift + S → Paste in docs/

---

## 💡 Pro Tips

1. Add **drill-through** — click on a month to see customer details
2. Use **bookmarks** for different views (2024 only, 2025 only, both)
3. Add **conditional formatting** — red bars for negative months
4. Set **data refresh** if you update the CSV files

---

*Guide prepared for: Shubham Zarekar | Infinity Collection Business Intelligence Project*
