## Column Index Reference
| #  | Column Name        |
|----|--------------------|
| 1  | order_id           |
| 2  | customer_id        |
| 3  | customer_name      |
| 4  | customer_email     |
| 5  | customer_city      |
| 6  | product_id         |
| 7  | product_name       |
| 8  | category           |
| 9  | unit_price         |
| 10 | quantity           |
| 11 | order_date         |
| 12 | sales_rep_id       |
| 13 | sales_rep_name     |
| 14 | sales_rep_email    |
| 15 | office_address     |

---

## Anomalies Summary

### 1. Insert Anomaly
- **Example Row:** 61  
- **Columns Involved:** 6 (product_id), 7 (product_name)  
- **Issue:**  
  Cannot insert a new product (e.g., P009) without filling unrelated fields like order_id, customer, and sales_rep details.

---

### 2. Update Anomaly
- **Example Rows:** 2, 3, 4  
- **Columns Involved:** 13 (sales_rep_name), 14 (sales_rep_email)  

| Row | sales_rep_name | sales_rep_email |
|-----|----------------|-----------------|
| 2   | Deepak Joshi   | deepak@corp.com |
| 3   | Deepak Joshi   | deepak@corp.com |
| 4   | Deepak Joshi   | deepak@corp.com |

- **Issue:**  
  If the email changes, it must be updated in multiple rows. Missing any row causes inconsistency.

---

### 3. Delete Anomaly
- **Example Row:** 61  
- **Columns Involved:** 6 (product_id), 7 (product_name)  
- **Issue:**  
  Deleting this row removes the only record of product P008 (Webcam), resulting in loss of product information.

---

## Final Summary
| Anomaly Type   | Rows     | Columns     | Problem |
|----------------|----------|-------------|---------|
| Insert         | 61       | 6–7         | Cannot add product without full order |
| Update         | 2, 3, 4  | 13–14       | Repeated data causes inconsistency |
| Delete         | 61       | 6–7         | Deleting row removes product info |
