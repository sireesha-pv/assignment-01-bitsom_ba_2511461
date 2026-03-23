## ETL Decisions

### Decision 1 — Standardizing Date Formats

Problem: The raw dataset contained inconsistent date formats such as DD-MM-YYYY, MM/DD/YYYY, and other variations, making it difficult to perform accurate time-based analysis and joins.

Resolution: All dates were converted into a consistent YYYY-MM-DD format. A surrogate date_id (YYYYMMDD) was also generated to link with the dim_date table, ensuring reliable and efficient time-based queries.

---

### Decision 2 — Handling NULL and Missing Values

Problem: Some records had NULL or missing values in important fields like quantity and total_amount, which could lead to incorrect aggregations and unreliable analysis.

Resolution: Missing values were cleaned by either recalculating fields (e.g., total_amount = quantity × unit_price) or removing incomplete records where necessary. All required fields in the fact table were ensured to have valid (non-null) values.

---

### Decision 3 — Standardizing Category Values

Problem: Product categories were inconsistent in casing (e.g., electronics, ELECTRONICS, Electronics), causing incorrect grouping in reports.

Resolution: All category values were standardized to a consistent format (Title Case, e.g., Electronics, Furniture, Stationery), ensuring accurate aggregation and reporting.
