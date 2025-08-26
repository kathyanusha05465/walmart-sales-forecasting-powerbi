# Walmart Sales Forecasting – Power BI

Production-style Power BI project that turns the Walmart weekly sales dataset into decision-ready insights.  
The model is lightweight (fact + dimension), refreshes from CSVs hosted in this repo, and follows PL-300 best practices.  
All M (Power Query) and DAX are versioned, and the PBIX is tracked with Git LFS.

---

## What’s inside
- **Executive Overview** – live KPIs, weekly sales pattern by store type, top store summary
- **Profitability Insights** – store-type contribution, holiday vs non-holiday profit, weekly profit trend
- **Reusable DAX library** – curated measures for KPIs, YoY, tooltips, and narrative labels
- **Reproducible refresh** – Power Query loads raw CSVs directly from GitHub (Anonymous)

## Dataset
- `train.csv` – weekly sales by Store & Dept  
- `features.csv` – Temperature, Fuel_Price, MarkDown1–5, CPI, Unemployment, IsHoliday  
- `stores.csv` – Store_Type & Size  

_Source:_ Kaggle Walmart Sales (files hosted in this repo for reproducible refresh)

## Data preprocessing (Power Query)
- Replace `"NA"` → `null` in MarkDown1–5  
- Enforce numeric types for **MarkDown1–5, CPI, Unemployment, Temperature, Fuel_Price**  
- Normalize names (e.g., `Type → Store_Type`)  
- Join **Sales ↔ Stores**, then enrich with **Features**  
- Add helpers: **Week_Num**, **Year**, labels/colors for clean visuals  
All query scripts are exported under `powerquery/queries/`.

## Data model
Star schema:
- **Fact**: `SalesFact`  
  *(Date, Store, Dept, Week_Num, Weekly_Sales, IsHoliday, Temperature, Fuel_Price, MarkDown1–5, CPI, Unemployment, Store_Type, Size)*
- **Dim**: `Stores` *(Store, Store_Type, Size, formatting fields)*
- **Relationship**: `Stores[Store] 1 ─── * SalesFact[Store]`

## Key KPIs (DAX)
- **Total_Sales**
- **Estimated_Profit** *(24.5% margin on sales)*
- **Avg_Weekly_Sales / Avg_Weekly_Profit** *(context-aware by selections)*
- **YoY_Sales_Growth** *(selected Year vs prior Year; blank for first year)*
- **Top_Store_ID / Top_StoreType** + narrative/tooltip helpers

### DAX & Docs
- Measures: [dax/measures/core_measures.dax](dax/measures/core_measures.dax)  
- Calc columns: [dax/calc-columns/fact_and_dim_columns.dax](dax/calc-columns/fact_and_dim_columns.dax)  
- Architecture: [Docs/Architecture.md](Docs/Architecture.md)  
- KPIs: [Docs/KPIs.md](Docs/KPIs.md)  
- Changelog: [Docs/CHANGELOG.md](Docs/CHANGELOG.md)

## Screens
- **Executive Overview** – KPIs, weekly pattern, top store type  
  [View screenshot](assets/screenshots/executive_overview.png)

- **Profitability Insights** – profit by store type, holiday vs non-holiday, weekly trend  
  [View screenshot](assets/screenshots/profitability_insights.png)

  Screenshots reflect the full date range. Key insights below summarize the latest year.

## How to open and refresh
1. Open **PowerBI_Files/Walmart_Sales.pbix** in Power BI Desktop.  
2. If prompted, set **Anonymous** credentials for `https://raw.githubusercontent.com/`.  
3. Home → **Transform data** (review) → **Close & Apply** → **Refresh**.

## Repo structure
- `PowerBI_Files/` – PBIX (Git LFS)
- `Data/` – `train.csv`, `features.csv`, `stores.csv` (raw inputs)
- `powerquery/queries/` – M code for `Sales`, `Features`, `Stores`, `Sales_Stores`, `SalesFact`
- `dax/measures/` – `core_measures.dax`
- `dax/calc-columns/` – `fact_and_dim_columns.dax`
- `assets/screenshots/` – dashboard images
- `Docs/` – architecture/KPIs/changelog

### Notes
- `YoY_Sales_Growth_v2` compares the selected **Year** to the prior year; first year shows blank by design.
- “Top Store” measures are filter-aware (respect slicers); “Top Store Type” is kept separate on purpose.

  ## Key insights (latest year in data)
- **Latest year:** 2012  
- **Top store:** Store **4** (Type **A**) with **$2.00bn** in sales.  
- **Year-over-year:** **–18%** vs prior year.  
- **Holiday impact:** **5%** of annual sales (≈ **$98.34M**).  
- **Peak trading week:** Week **15**.


License: MIT — see [LICENSE](LICENSE)
