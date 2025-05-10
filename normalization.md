# Database Normalization 

## Objective
This document outlines the normalization process applied to the Airbnb-style database schema, ensuring compliance up to Third Normal Form (3NF).

---

## First Normal Form (1NF)

- All attributes are atomic and indivisible.
- No repeating groups or nested structures exist.

**Result: Schema passes 1NF.**

---

## Second Normal Form (2NF)

- All tables have a single-column primary key (UUIDs).
- No partial dependencies exist, as no composite keys are used.

**Result: Schema passes 2NF.**

---

## Third Normal Form (3NF)

- All non-key attributes are directly dependent on the primary key.
- There are no transitive dependencies. Examples:

  - Property does not store host details (these reside in the User table).
  - Booking does not store user or property details redundantly.
  - Review and Payment entities store only directly related data.

- The `total_price` field in Booking is retained for historical accuracy despite being derivable.

**Result: Schema passes 3NF.**

---

## Conclusion

The database design achieves Third Normal Form (3NF), ensuring minimal redundancy, strong referential integrity, and optimized data structure for future scalability.
