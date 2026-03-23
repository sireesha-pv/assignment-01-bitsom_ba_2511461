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


## Normalization Justification
"Your manager argues that keeping everything in one table is simpler and normalization is over-engineering. Using specific examples from the dataset, defend or refute this position."


Although storing all data in a single table may seem simpler initially, this approach creates serious data integrity and maintenance issues, as seen in the given dataset. The flat structure leads to high redundancy, where the same information is repeated across multiple rows.

For instance, customer details such as name, email, and city are duplicated for every order placed by the same customer (e.g., customer C001 appears repeatedly). If the customer updates their email or moves to a new city, all related rows must be updated. Failing to update even one row results in inconsistent data, demonstrating an update anomaly. Similarly, sales representative information is repeated across many records, increasing the risk of errors and inconsistency.

The dataset also suffers from insert anomalies. A new product cannot be added independently unless it is associated with an order, which forces the inclusion of unnecessary data such as customer and sales representative details. Additionally, delete anomalies are present—removing a row that contains the only record of a specific product results in the complete loss of that product’s information.

### Third Normal Form (3NF)

Third Normal Form (3NF) is a level of database normalization where a table is already in Second Normal Form (2NF), and all non-key attributes depend only on the primary key, with no transitive dependencies. This means that no non-key attribute should depend on another non-key attribute.

By applying 3NF and organizing data into separate tables such as Customers, Products, and Orders, redundancy is eliminated and dependencies are properly managed. This ensures data consistency, simplifies updates, and improves overall database reliability. Therefore, normalization is not over-engineering but a fundamental practice for building efficient, scalable, and maintainable database systems.

