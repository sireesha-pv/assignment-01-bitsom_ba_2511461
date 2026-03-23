##   Examples of Anomalies

---

### 1. Insert Anomaly
- **Example Row Reference:** Product **P003 (Desk Chair)** appears in rows like 30, 31  
- **Columns Involved:** 6 (product_id), 7 (product_name), 9 (unit_price)

- **Issue:**
  If you want to insert a new product:
  - `P010, Monitor, Electronics, 12000`

   You cannot insert it independently  
   You must provide:
  - order_id (Col 1)
  - customer details (Cols 2–5)
  - sales rep details (Cols 12–15)

---

### 2. Update Anomaly
- **Example Rows:** 1, 6, 7  
- **Columns Involved:** 2–5 (customer details)

| Row | customer_name | customer_email     | customer_city |
|-----|---------------|--------------------|---------------|
| 1   | Rohan Mehta  | rohan@gmail.com    | Mumbai        |
| 6   | Rohan Mehta  | rohan@gmail.com    | Mumbai        |
| 7   | Rohan Mehta  | rohan@gmail.com    | Mumbai        |

- **Issue:**
  If **Rohan Mehta** changes city:
  - You must update **Column 5** in all rows  
  - Missing one → inconsistent data

---

### 3. Delete Anomaly
- **Example Row:** 32  
- **Columns Involved:** 6 (product_id), 7 (product_name)

- Row 32 contains:
  - Product **P003 (Desk Chair)** for a specific customer

- **Issue:**
  If this row is the only record for a **specific customer-product relationship**:
  - Deleting it removes:
    - Product purchase history
    - Possibly customer-product association

---

## Summary 
| Anomaly Type | Rows     | Columns   | Problem |
|--------------|----------|-----------|---------|
| Insert       | 30–31    | 6–9       | Cannot add product without full order |
| Update       | 1, 6, 7  | 2–5       | Repeated customer data |
| Delete       | 32       | 6–7       | Loss of product/customer relationship |
