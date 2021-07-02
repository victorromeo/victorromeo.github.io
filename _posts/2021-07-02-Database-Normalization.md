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