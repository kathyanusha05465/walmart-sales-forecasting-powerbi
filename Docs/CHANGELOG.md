# Changelog
All notable changes to this project will be documented in this file.  
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and the project adheres to [Semantic Versioning](https://semver.org/).

## [0.2.0] - 2025-08-25
### Added
- **Latest-year insight measures** in `dax/measures/core_measures.dax`:
  `Total_Sales_LY`, `YoY_Sales_Growth_LY`, `Holiday_Share_LY`, `Top_Store_ID_LY`, `Top_StoreType_LY`.
- **Hidden “Insights” page** (dev-only) with validation table for LY metrics.
- **README updates**: Key Insights section + links to screenshots.
- **Dashboard images** in `assets/screenshots/`:
  `Executive_Overview.png`, `Profitability_Insights.png`.

### Changed
- Minor DAX tidy-up (naming, formats) where applicable.

## [0.1.0] - 2025-08-24
### Added
- Initial repository scaffold and PBIX tracked via **Git LFS** (`PowerBI_Files/`).
- **Power Query**:
  - Typed `CPI` and `Unemployment` as numbers in `powerquery/queries/Features.m`.
  - Exported M for `Sales`, `Features`, `Stores`, `Sales_Stores`, `SalesFact` to `powerquery/queries/`.
- **DAX**:
  - `Year` calculated column.
  - `YoY_Sales_Growth_v2` measure.
  - `Top_Store_ID_Measure` prototype.
- Project docs skeleton (`Docs/`) and `.gitattributes` for LFS.

---

[0.2.0]: https://github.com/<your-username>/walmart-sales-forecasting-powerbi/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/<your-username>/walmart-sales-forecasting-powerbi/tree/v0.1.0
