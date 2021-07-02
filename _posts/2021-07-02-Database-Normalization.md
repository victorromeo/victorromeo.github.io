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

||UNF|1NF|2NF|3NF|EKNF|BCNF|4NF|ETNF|5NF|DKNF|6NF|
|----|---|---|---|--|--|---|---|---|---|---|---|
|Primary key (no duplicate tuples)	| :white_circle: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
|Atomic columns (cells cannot have tables as values)| :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
|Every non-trivial functional dependency either does not begin with a proper subset of a candidate key or ends with a prime attribute (no partial functional dependencies of non-prime attributes on candidate keys)	| :x: | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
|Every non-trivial functional dependency either begins with a superkey or ends with a prime attribute (no transitive functional dependencies of non-prime attributes on candidate keys)| :x: | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
|Every non-trivial functional dependency either begins with a superkey or ends with an elementary prime attribute| :x: | :x: | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |N/A|
|Every non-trivial functional dependency begins with a superkey	| :x: | :x: | :x: | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |N/A|
|Every non-trivial multivalued dependency begins with a superkey| :x: | :x: | :x: | :x: | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |N/A|
|Every join dependency has a superkey component| :x: | :x: | :x: | :x: | :x: | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |N/A|
|Every join dependency has only superkey components| :x: | :x: | :x: | :x: | :x: | :x: | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: |N/A|
|Every constraint is a consequence of domain constraints and key constraints| :x: | :x: | :x: | :x: | :x: | :x: | :x: | :x: | :x: | :heavy_check_mark: | :x: |
|Every join dependency is trivial	| :x:	| :x:	| :x:	| :x: |	:x: |	:x: |	:x:	| :x:	| :x:	| :x:	| :heavy_check_mark: |

