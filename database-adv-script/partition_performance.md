##  Partitioning Performance Report

### Objective
Optimize query performance on the large `booking` table by implementing table partitioning using the `start_date` column.

---

###  Implementation Summary

- Created a new table: `booking_partitioned`
- Partitioned by `RANGE` on the `start_date` field
- Defined quarterly partitions for the year 2023

---

###  Query Tested

```sql
SELECT * FROM booking_partitioned
WHERE start_date BETWEEN '2023-04-01' AND '2023-06-30';
