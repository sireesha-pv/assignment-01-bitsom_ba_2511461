## Storage Systems

To support the four goals of the hospital system, a combination of storage technologies was selected based on data type, workload, and performance requirements. A **relational database (OLTP system)** such as MySQL is used to store structured patient records, treatment history, and transactional data. This ensures strong consistency and reliability through ACID properties, which are critical in healthcare environments.

For real-time ICU monitoring data, a **NoSQL or time-series database** is used. These systems are optimized for high-velocity data ingestion and can efficiently handle continuous streams of vitals such as heart rate and oxygen levels. Their BASE properties allow for high availability and scalability, which is essential for real-time monitoring.

A **data warehouse (OLAP system)** is used to store cleaned, historical data for reporting and analytics. It supports complex queries required for generating monthly reports like bed occupancy and department-wise costs. The structured schema (e.g., star schema) enables efficient aggregation and analysis.

Additionally, a **data lake or intermediate storage layer** may be used to store raw, unprocessed data, especially for machine learning workflows. This allows flexibility in handling diverse data formats and supports feature engineering for predictive models.

---

## OLTP vs OLAP Boundary

In this architecture, the boundary between OLTP and OLAP systems is clearly defined by the nature and purpose of the data. The **OLTP layer** handles real-time, transactional operations such as patient admissions, updates to medical records, and treatment logs. This layer prioritizes fast writes, data integrity, and consistency.

The transition to the **OLAP layer** occurs through ETL (Extract, Transform, Load) pipelines. Data from the OLTP system is periodically extracted, cleaned, and transformed before being loaded into the data warehouse. Once in the OLAP system, the data is used for analytical queries, reporting, and machine learning model training.

Thus, the OLTP system ends at the point where raw transactional data is captured, and the OLAP system begins where data is structured and optimized for analysis. This separation ensures that analytical workloads do not impact the performance of transactional systems.

---

## Trade-offs

One significant trade-off in this design is the **increased system complexity** due to the use of multiple storage systems (relational DB, NoSQL, and data warehouse). While each system is optimized for a specific purpose, managing and integrating them requires additional infrastructure, data pipelines, and maintenance effort.

This complexity can lead to challenges such as data duplication, synchronization delays, and higher operational costs. For example, data must be consistently transferred from the OLTP system to the data warehouse, which may introduce latency in reporting.

To mitigate this trade-off, the system can implement **automated ETL pipelines and data orchestration tools** (e.g., Apache Airflow) to ensure reliable and timely data movement. Additionally, adopting a **unified data governance strategy** helps maintain data consistency across systems. Over time, the architecture could also evolve toward a **data lakehouse approach**, which combines multiple capabilities into a single platform, reducing complexity while maintaining performance and scalability.
