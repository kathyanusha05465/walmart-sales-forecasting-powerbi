# Walmart Sales Forecasting – Power BI

A production‑style Power BI project that analyzes Walmart Canada’s weekly sales and profitability and surfaces store‑level insights with drill‑through. The model is lightweight (fact + dimension), refreshes from raw CSVs hosted on GitHub, and follows PL‑300 best practices.

## What’s inside
- **Executive Overview** – live KPIs, weekly sales pattern, top store type
- **Profitability Insights** – store-type breakdown, holiday vs non‑holiday profit, weekly profit trend, smart narrative
- **Reusable DAX library** – curated measures for KPIs, tooltips, and storytelling
- **Automated inputs** – data pulled directly from GitHub raw CSVs (Power Query)

## Dataset
- `train.csv` – weekly sales by store & department  
- `features.csv` – fuel prices, markdowns, CPI, temperature, holidays  
- `stores.csv` – store type & size  

_Source:_ Kaggle Walmart Sales (hosted via GitHub for reproducible refresh)

## Data model
Star schema:
- **Fact**: `SalesFact` (Date, Store, Dept, Week_Num, Weekly_Sales, markdowns, economic drivers)
- **Dim**: `Stores` (Store, Store_Type, Size, formatting fields)
- Relationship: `Stores[Store] 1 ─── * SalesFact[Store]`

## Key KPIs (DAX)
- **Total Sales**
- **Estimated Profit** (assumed margin 24.5%)
- **Avg Weekly Sales / Profit** (context‑aware by selections)
- **YoY Sales Growth**
- **Top Store Type** + narrative/tooltip helpers

Complete DAX library lives in [`/Documentation/DAX_Measures.md`](Documentation/DAX_Measures.md).

## Screens
See `/Screenshots` for full dashboards (Executive Overview & Profitability Insights) with drill‑through examples.

## How to run
1. Open `PowerBI_Files/Walmart Project.pbix` (or connect from new PBIX).
2. In **Power Query**, sources point to GitHub raw CSVs (no local paths).
3. Refresh. Model builds and measures compute automatically.

## Repo structure

