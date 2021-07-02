Database Normalisation is the process of enforcing relationships between database types, to preserve hierarchy, prevent duplication and thereby strengthen database resiliency and data integrity.

## [Database Normalization](https://en.wikipedia.org/wiki/Database_normalization)

||UNF|1NF|2NF|3NF|EKNF|BCNF|4NF|ETNF|5NF|DKNF|6NF|
|----|---|---|---|--|--|---|---|---|---|---|---|
|Primary key (no duplicate tuples)	|:white_circle:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Atomic columns (cells cannot have tables as values)|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Every non-trivial functional dependency either does not begin with a proper subset of a candidate key or ends with a prime attribute (no partial functional dependencies of non-prime attributes on candidate keys)	|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Every non-trivial functional dependency either begins with a superkey or ends with a prime attribute (no transitive functional dependencies of non-prime attributes on candidate keys)|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Every non-trivial functional dependency either begins with a superkey or ends with an elementary prime attribute|:x:|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|N/A|
|Every non-trivial functional dependency begins with a superkey	|:x:|:x:|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|N/A|
|Every non-trivial multivalued dependency begins with a superkey|:x:|:x:|:x:|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|N/A|
|Every join dependency has a superkey component|:x:|:x:|:x:|:x:|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|N/A|
|Every join dependency has only superkey components|:x:|:x:|:x:|:x:|:x:|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|N/A|
|Every constraint is a consequence of domain constraints and key constraints|:x:|:x:|:x:|:x:|:x:|:x:|:x:|:x:|:x:|:heavy_check_mark:|:x:|
|Every join dependency is trivial	|:x:	|:x:	|:x:	|:x:|	:x:|	:x:|	:x:	|:x:	|:x:	|:x:	|:heavy_check_mark:|

