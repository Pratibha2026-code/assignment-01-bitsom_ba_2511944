## Storage Systems

In this architecture, different storage systems are used based on the type of data and use case.

A Data Lake is used to store all raw hospital data such as patient records, ICU device streams, billing data, and doctor notes. This is useful because it can handle both structured and unstructured data and is scalable for large volumes of historical data.

A Data Warehouse is used for reporting purposes such as monthly hospital reports, department-wise costs, and bed occupancy. It stores cleaned and structured data optimized for analytical queries, making it suitable for fast reporting and business intelligence.

A NoSQL Database is used to store patient profiles and recent medical history. This allows quick retrieval of patient data when doctors query the system in natural language. NoSQL is flexible and supports fast read operations, which is important for real-time access.

For real-time ICU monitoring, streaming data is processed and can also be stored in the Data Lake or a time-series optimized storage system for continuous updates and alerts.

---

## OLTP vs OLAP Boundary

The OLTP (Online Transaction Processing) system includes the data sources such as EHR systems, billing systems, ICU devices, and doctor notes. These systems handle real-time transactions like updating patient records, recording billing information, and capturing live vitals.

The OLAP (Online Analytical Processing) system begins at the Data Warehouse. After data is collected and processed through batch or streaming pipelines, it is transformed and stored in the warehouse for analysis.

The boundary between OLTP and OLAP lies at the Data Lake and ingestion layer. Raw transactional data flows from OLTP systems into the Data Lake, where it is then processed and moved into the Data Warehouse for analytical use.

This separation ensures that operational systems are not slowed down by heavy analytical queries.

---

## Trade-offs

One significant trade-off in this design is between real-time processing and system complexity. Supporting real-time ICU monitoring using streaming systems increases system complexity, cost, and maintenance effort.

However, real-time processing is critical for patient safety, as delays in detecting abnormal vitals can have serious consequences.

To mitigate this, a hybrid approach is used. Only critical ICU data is processed in real-time for alerts, while less critical data is processed in batches for reporting. Additionally, scalable tools like Kafka can be used to manage streaming efficiently.

This approach balances performance, cost, and complexity while still meeting the system requirements.