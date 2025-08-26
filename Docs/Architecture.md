# Architecture

## Data sources
- `Data/train.csv` – Weekly sales by Store/Dept/Date
- `Data/features.csv` – Temperature, Fuel_Price, MarkDown1–5, CPI, Unemployment, IsHoliday
- `Data/stores.csv` – Store metadata (Type, Size)

Power Query loads CSVs from the repo via GitHub raw URLs (Anonymous).

## Power Query (M) flow
- **Sales**: type columns.
- **Stores**: `Type → Store_Type`.
- **Features**: replace `"NA"`→null for MarkDown1–5, cast MarkDown1–5 **and** CPI/Unemployment to number.
- **Sales_Stores**: Sales ⟵⟶ Stores (on Store).
- **SalesFact**: Sales_Stores ⟵⟶ Features (on Store+Date) → final fact.

## Model
- **Fact**: `SalesFact(Store, Dept, Date, Weekly_Sales, IsHoliday, Temperature, Fuel_Price, MarkDown1–5, CPI, Unemployment, Store_Type, Size)`
- **Dim**: `Stores(Store, Store_Type, Size, Store Label)`
- Relationship: `Stores[Store] 1⟶* SalesFact[Store]`
- Calculated columns (minimal): `Year = YEAR(SalesFact[Date])`

## Measures (core)
- `Total_Sales = SUM(SalesFact[Weekly_Sales])`
- `Estimated_Profit = [Total_Sales] * 0.245`
- `YoY_Sales_Growth_v2` – prior-year compare using `SalesFact[Year]`
- `Top_Store_ID_Measure` – filter-aware TOPN over Stores

## Assumptions & limits
- Week-level visuals use `Week_Num` across years (by design for now).
- Profit is a fixed 24.5% margin (assumption).
- No separate Date dimension yet (kept minimal for recruiting demo).
- Source is Kaggle Walmart Sales; values are illustrative for demo.
