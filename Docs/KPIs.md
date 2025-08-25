# KPIs

| KPI | Definition | DAX / Logic | Why it matters |
|---|---|---|---|
| Total Sales | Sum of weekly sales | `Total_Sales = SUM(SalesFact[Weekly_Sales])` | Baseline revenue |
| Estimated Profit | 24.5% margin on sales | `Estimated_Profit = [Total_Sales] * 0.245` | Quick profitability proxy |
| YoY Sales Growth | (Salesᶜʸ − Salesᵖʸ) / Salesᵖʸ | `YoY_Sales_Growth_v2` using `SalesFact[Year]` | Growth signal despite seasonality |
| Top Performing Store | Store ID with max sales in filter context | `Top_Store_ID_Measure` via TOPN | Who drives performance |
| Avg Weekly Profit | Profit / distinct weeks | `Avg_Weekly_Profit` | Normalizes for time range |

**Notes**
- First year YoY is blank (no prior year).
- Top store measure is **filter-aware** (slicers change result).

