---
layout: post
title: "Database Normalization"
date: 2021-07-02
tags: database normalization
image: https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
thumb: https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@markusspiske
type: spec
---

Database Normalization is the process of enforcing relationships between database types, to preserve hierarchy, prevent duplication and thereby strengthen database resiliency and data integrity.

## [Database Normalization](https://en.wikipedia.org/wiki/Database_normalization)

||Unnormalized|1st<br>Normal Form|2nd<br>Normal Form|3rd<br>Normal Form|Elementary Key<br>Normal Form|Boyce-Codd<br>Normal Form|4th<br>Normal Form|Essential Tuple<br>Normal Form|5th<br>Normal Form|Domain Key<br>Normal Form|6th<br>Normal Form|
|----|---|---|---|--|--|---|---|---|---|---|---|
|Primary key (no duplicate tuples)	| Maybe | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ |
|Atomic columns (cells cannot have tables as values)| ❌ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ |
|Every non-trivial functional dependency either does not begin with a proper subset of a candidate key or ends with a prime attribute (no partial functional dependencies of non-prime attributes on candidate keys)	| ❌ | ❌ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ |
|Every non-trivial functional dependency either begins with a superkey or ends with a prime attribute (no transitive functional dependencies of non-prime attributes on candidate keys)| ❌ | ❌ | ❌ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ |
|Every non-trivial functional dependency either begins with a superkey or ends with an elementary prime attribute| ❌ | ❌ | ❌ | ❌ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ |N/A|
|Every non-trivial functional dependency begins with a superkey	| ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ✔️ | ✔️ | ✔️ | ✔️ |N/A|
|Every non-trivial multivalued dependency begins with a superkey| ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ✔️ | ✔️ | ✔️ |N/A|
|Every join dependency has a superkey component| ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ✔️ | ✔️ |N/A|
|Every join dependency has only superkey components| ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ✔️ |N/A|
|Every constraint is a consequence of domain constraints and key constraints| ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ❌ | ✔️ | ❌ |
|Every join dependency is trivial	| ❌	| ❌	| ❌	| ❌ |	❌ |	❌ |	❌	| ❌	| ❌	| ❌	| ✔️ |

- It is typical to aim to achieve at least `4th Normal Form`
- First achieve `1st Normal Form`, then `2nd Normal Form` etc. 
- It is unusual to see `6th normal form` implemented in real world scenarios

## Summary


Database normalization is a process in database design that involves organizing the data in a relational database in a structured and efficient manner. The goal of normalization is to eliminate data redundancy and improve data integrity while ensuring that the database remains flexible and scalable.

The process of normalization typically involves dividing a large table into multiple smaller tables and establishing relationships between them using keys. The most widely used normal forms are:

First Normal Form (1NF):

Each table cell should contain a single value, avoiding multivalued attributes or repeating groups.
Each column should have a unique name.
Each row should be uniquely identifiable using a primary key.

Second Normal Form (2NF):

The table must already be in 1NF.
All non-key attributes should be fully dependent on the entire primary key, not just part of it.
If a table has a composite primary key (made up of multiple columns), each non-key attribute should be related to all parts of the composite key.

Third Normal Form (3NF):

The table must already be in 2NF.
There should be no transitive dependencies, meaning that non-key attributes should not depend on other non-key attributes.
Any non-key attribute should only depend on the primary key of the table.

Boyce-Codd Normal Form (BCNF):

The table must already be in 3NF.
A stronger version of the 3NF, where every determinant (a set of attributes that uniquely determines other attributes) is a candidate key.

Fourth Normal Form (4NF):

The table must already be in BCNF.
It addresses multi-valued dependencies, ensuring that there are no repeating groups in the table.
There are additional normal forms beyond 4NF, such as the Fifth Normal Form (5NF) and Domain-Key Normal Form (DK/NF), but they are less commonly used in practice.

By following the normalization process, databases can reduce data redundancy, improve data consistency and integrity, facilitate data maintenance and updates, and enhance query performance. However, it's important to strike a balance between normalization and denormalization, as excessive normalization can lead to more complex queries and potentially slower performance for certain types of queries. The appropriate level of normalization depends on the specific requirements and use cases of the database.