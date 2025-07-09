# Assumptions

## 1. Profit Margin

Since the dataset does not include cost of goods sold (COGS), we estimate profit using a flat **24.5% gross margin**, based on Walmart’s publicly reported values between 2023–2025.

- 📊 Gross Margin Range: 24.09% – 24.88%
- 📌 Source: Macrotrends.net – Walmart Gross Margin Historical Data

```DAX
Estimated_Profit = [Total_Sales] * 0.245

