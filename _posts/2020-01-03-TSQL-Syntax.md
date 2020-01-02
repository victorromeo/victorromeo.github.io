---
layout: post
title: "TSQL (Transact-SQL) Syntax"
date: 2020-01-02
tags: database query syntax
image: https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9
thumb: https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60
imagecredit: https://unsplash.com/@markusspiske
type: spec
---

A basic syntax guide for TSQL, used by SQL Server and Azure SQL Database, Azure Synapse Analytics and Parallel Data Warehouse

## Types of SQL Commands
- DDL Data Definition Language
  - CREATE, ALTER, DROP, RENAME, TRUNCATE, COMMENT
- DQL Data Query Language
  - SELECT
- DML Data Manipulation Language
  - INSERT, UPDATE, DELETE, MERGE, CALL, EXPLAIN PLAN, LOCK TABLE
- DCL Data Control Language
  - GRANT, REVOKE

## SELECT - Reading objects from the database

**SYNTAX**
```  
<SELECT statement> ::=    
    [ WITH { [ XMLNAMESPACES ,] [ <common_table_expression> [,...n] ] } ]  
    <query_expression>   
    [ ORDER BY { order_by_expression | column_position [ ASC | DESC ] }   
  [ ,...n ] ]   
    [ <FOR Clause>]   
    [ OPTION ( <query_hint> [ ,...n ] ) ]   
<query_expression> ::=   
    { <query_specification> | ( <query_expression> ) }   
    [  { UNION [ ALL ] | EXCEPT | INTERSECT }  
        <query_specification> | ( <query_expression> ) [...n ] ]   
<query_specification> ::=   
SELECT [ ALL | DISTINCT ]   
    [TOP ( expression ) [PERCENT] [ WITH TIES ] ]   
    < select_list >   
    [ INTO new_table ]   
    [ FROM { <table_source> } [ ,...n ] ]   
    [ WHERE <search_condition> ]   
    [ <GROUP BY> ]   
    [ HAVING < search_condition > ]  
```

**EXAMPLE**
```sql
SELECT *  
FROM DimEmployee  
ORDER BY LastName;
```

### SELECT INTO -- Inserting records into the database which are derived from other data

**SYNTAX**
```
[ INTO new_table ]
[ ON filegroup ]
```

**EXAMPLE**
```sql
SELECT c.FirstName, c.LastName, e.JobTitle, a.AddressLine1, a.City,   
    sp.Name AS [State/Province], a.PostalCode  
INTO dbo.EmployeeAddresses  
FROM Person.Person AS c  
    JOIN HumanResources.Employee AS e   
    ON e.BusinessEntityID = c.BusinessEntityID  
    JOIN Person.BusinessEntityAddress AS bea  
    ON e.BusinessEntityID = bea.BusinessEntityID  
    JOIN Person.Address AS a  
    ON bea.AddressID = a.AddressID  
    JOIN Person.StateProvince as sp   
    ON sp.StateProvinceID = a.StateProvinceID;  
GO 
```


### SELECT OVER -- Reads objects from the database, after defining a window or subset of record to query

**SYNTAX**
```
-- Syntax for SQL Server, Azure SQL Database, and Azure SQL Data Warehouse  
  
OVER (   
       [ <PARTITION BY clause> ]  
       [ <ORDER BY clause> ]   
       [ <ROW or RANGE clause> ]  
      )  
  
<PARTITION BY clause> ::=  
PARTITION BY value_expression , ... [ n ]  
  
<ORDER BY clause> ::=  
ORDER BY order_by_expression  
    [ COLLATE collation_name ]   
    [ ASC | DESC ]   
    [ ,...n ]  
  
<ROW or RANGE clause> ::=  
{ ROWS | RANGE } <window frame extent>  
  
<window frame extent> ::=   
{   <window frame preceding>  
  | <window frame between>  
}  
<window frame between> ::=   
  BETWEEN <window frame bound> AND <window frame bound>  
  
<window frame bound> ::=   
{   <window frame preceding>  
  | <window frame following>  
}  
  
<window frame preceding> ::=   
{  
    UNBOUNDED PRECEDING  
  | <unsigned_value_specification> PRECEDING  
  | CURRENT ROW  
}  
  
<window frame following> ::=   
{  
    UNBOUNDED FOLLOWING  
  | <unsigned_value_specification> FOLLOWING  
  | CURRENT ROW  
}  
  
<unsigned value specification> ::=   
{  <unsigned integer literal> }  
```

**EXAMPLE**

```sql
USE AdventureWorks2012;  
GO  
SELECT ROW_NUMBER() OVER(PARTITION BY PostalCode ORDER BY SalesYTD DESC) AS "Row Number",   
    p.LastName, s.SalesYTD, a.PostalCode  
FROM Sales.SalesPerson AS s   
    INNER JOIN Person.Person AS p   
        ON s.BusinessEntityID = p.BusinessEntityID  
    INNER JOIN Person.Address AS a   
        ON a.AddressID = p.BusinessEntityID  
WHERE TerritoryID IS NOT NULL   
    AND SalesYTD <> 0  
ORDER BY PostalCode;  
GO  
```

## INSERT - Adding records into the database

**SYNTAX**

```
-- Syntax for SQL Server and Azure SQL Database  

[ WITH <common_table_expression> [ ,...n ] ]  
INSERT   
{  
        [ TOP ( expression ) [ PERCENT ] ]   
        [ INTO ]   
        { <object> | rowset_function_limited   
          [ WITH ( <Table_Hint_Limited> [ ...n ] ) ]  
        }  
    {  
        [ ( column_list ) ]   
        [ <OUTPUT Clause> ]  
        { VALUES ( { DEFAULT | NULL | expression } [ ,...n ] ) [ ,...n     ]   
        | derived_table   
        | execute_statement  
        | <dml_table_source>  
        | DEFAULT VALUES   
        }  
    }  
}  
[;]  
  
<object> ::=  
{   
    [ server_name . database_name . schema_name .   
      | database_name .[ schema_name ] .   
      | schema_name .   
    ]  
  table_or_view_name  
}  
  
<dml_table_source> ::=  
    SELECT <select_list>  
    FROM ( <dml_statement_with_output_clause> )   
      [AS] table_alias [ ( column_alias [ ,...n ] ) ]  
    [ WHERE <search_condition> ]  
        [ OPTION ( <query_hint> [ ,...n ] ) ]  
```

**EXAMPLE**

```sql
INSERT INTO Cities (Location)  
VALUES ( CONVERT(Point, '12.3:46.2') );  
```

## UPDATE - Modifying a set of records in the database

**SYNTAX**

```
-- Syntax for SQL Server and Azure SQL Database  

[ WITH <common_table_expression> [...n] ]  
UPDATE   
    [ TOP ( expression ) [ PERCENT ] ]   
    { { table_alias | <object> | rowset_function_limited   
         [ WITH ( <Table_Hint_Limited> [ ...n ] ) ]  
      }  
      | @table_variable      
    }  
    SET  
        { column_name = { expression | DEFAULT | NULL }  
          | { udt_column_name.{ { property_name = expression  
                                | field_name = expression }  
                                | method_name ( argument [ ,...n ] )  
                              }  
          }  
          | column_name { .WRITE ( expression , @Offset , @Length ) }  
          | @variable = expression  
          | @variable = column = expression  
          | column_name { += | -= | *= | /= | %= | &= | ^= | |= } expression  
          | @variable { += | -= | *= | /= | %= | &= | ^= | |= } expression  
          | @variable = column { += | -= | *= | /= | %= | &= | ^= | |= } expression  
        } [ ,...n ]   
  
    [ <OUTPUT Clause> ]  
    [ FROM{ <table_source> } [ ,...n ] ]   
    [ WHERE { <search_condition>   
            | { [ CURRENT OF   
                  { { [ GLOBAL ] cursor_name }   
                      | cursor_variable_name   
                  }   
                ]  
              }  
            }   
    ]   
    [ OPTION ( <query_hint> [ ,...n ] ) ]  
[ ; ]  
  
<object> ::=  
{   
    [ server_name . database_name . schema_name .   
    | database_name .[ schema_name ] .   
    | schema_name .  
    ]  
    table_or_view_name}  
```

**EXAMPLE**

```sql
USE AdventureWorks2012;  
GO  
UPDATE Sales.SalesPerson  
SET Bonus = 6000, CommissionPct = .10, SalesQuota = NULL;  
GO 
```

## DELETE - Removing records from the database

**SYNTAX**

```
-- Syntax for SQL Server and Azure SQL Database  
  
[ WITH <common_table_expression> [ ,...n ] ]  
DELETE   
    [ TOP ( expression ) [ PERCENT ] ]   
    [ FROM ]   
    { { table_alias  
      | <object>   
      | rowset_function_limited   
      [ WITH ( table_hint_limited [ ...n ] ) ] }   
      | @table_variable  
    }  
    [ <OUTPUT Clause> ]  
    [ FROM table_source [ ,...n ] ]   
    [ WHERE { <search_condition>   
            | { [ CURRENT OF   
                   { { [ GLOBAL ] cursor_name }   
                       | cursor_variable_name   
                   }   
                ]  
              }  
            }   
    ]   
    [ OPTION ( <Query Hint> [ ,...n ] ) ]   
[; ]  
  
<object> ::=  
{   
    [ server_name.database_name.schema_name.   
      | database_name. [ schema_name ] .   
      | schema_name.  
    ]  
    table_or_view_name   
}  
```

**EXAMPLE**
```sql
DELETE FROM Production.ProductCostHistory  
WHERE StandardCost > 1000.00;  
GO  
```

## ALTER

### ALTER TABLE ADD COLUMN

**SYNTAX**

```
 ALTER TABLE table_name
              ADD (Columnname_1  datatype,
              Columnname_2  datatype,
              …
              Columnname_n  datatype);
```

**EXAMPLE**

```sql
ALTER TABLE Student ADD (AGE number(3),COURSE varchar(40));
```

### ALTER TABLE DROP COLUMN

**SYNTAX**

```
ALTER TABLE table_name
DROP COLUMN column_name;
```

**EXAMPLE**

```sql
ALTER TABLE Student DROP COLUMN COURSE;
```

### ALTER TABLE ALTER COLUMN

**SYNTAX**

```
ALTER TABLE table_name
ALTER COLUMN column_name column_type;
```

**EXAMPLE**

```sql
ALTER TABLE Student ALTER COLUMN COURSE varchar(50)
```

## CREATE 

### CREATE DATABASE

**SYNTAX**

```
CREATE DATABASE database_name;
```
**EXAMPLE**

```sql
CREATE DATABASE Retail;
```

**SYNTAX** (COMPLETE)

```
CREATE DATABASE database_name
[ CONTAINMENT = { NONE | PARTIAL } ]
[ ON
      [ PRIMARY ] <filespec> [ ,...n ]
      [ , <filegroup> [ ,...n ] ]
      [ LOG ON <filespec> [ ,...n ] ]
]
[ COLLATE collation_name ]
[ WITH <option> [,...n ] ]
[;]

<option> ::=
{
      FILESTREAM ( <filestream_option> [,...n ] )
    | DEFAULT_FULLTEXT_LANGUAGE = { lcid | language_name | language_alias }
    | DEFAULT_LANGUAGE = { lcid | language_name | language_alias }
    | NESTED_TRIGGERS = { OFF | ON }
    | TRANSFORM_NOISE_WORDS = { OFF | ON}
    | TWO_DIGIT_YEAR_CUTOFF = <two_digit_year_cutoff>
    | DB_CHAINING { OFF | ON }
    | TRUSTWORTHY { OFF | ON }
    | PERSISTENT_LOG_BUFFER=ON ( DIRECTORY_NAME='<Filepath to folder on DAX formatted volume>' )
}

<filestream_option> ::=
{
      NON_TRANSACTED_ACCESS = { OFF | READ_ONLY | FULL }
    | DIRECTORY_NAME = 'directory_name'
}

<filespec> ::=
{
(
    NAME = logical_file_name ,
    FILENAME = { 'os_file_name' | 'filestream_path' }
    [ , SIZE = size [ KB | MB | GB | TB ] ]
    [ , MAXSIZE = { max_size [ KB | MB | GB | TB ] | UNLIMITED } ]
    [ , FILEGROWTH = growth_increment [ KB | MB | GB | TB | % ] ]
)
}

<filegroup> ::=
{
FILEGROUP filegroup name [ [ CONTAINS FILESTREAM ] [ DEFAULT ] | CONTAINS MEMORY_OPTIMIZED_DATA ]
    <filespec> [ ,...n ]
}

<service_broker_option> ::=
{
    ENABLE_BROKER
  | NEW_BROKER
  | ERROR_BROKER_CONVERSATIONS
}
```

**EXAMPLE**

```sql
USE master;
GO
IF DB_ID (N'mytest') IS NOT NULL
DROP DATABASE mytest;
GO
CREATE DATABASE mytest;
GO
-- Verify the database files and sizes
SELECT name, size, size*1.0/128 AS [Size in MBs]
FROM sys.master_files
WHERE name = N'mytest';
GO
```

### CREATE TABLE

**SYNTAX**

```
-- Simple CREATE TABLE Syntax (common if not using options)
CREATE TABLE
    { database_name.schema_name.table_name. | schema_name.table_name | table_name }
    ( { <column_definition> } [ ,...n ] )
[ ; ]
```

**EXAMPLE**

```sql
CREATE TABLE dbo.Employee (
    EmployeeID INT PRIMARY KEY CLUSTERED
);
```

### CREATE PROCEDURE

**SYNTAX**

```
-- Transact-SQL Syntax for Stored Procedures in SQL Server and Azure SQL Database  
  
CREATE [ OR ALTER ] { PROC | PROCEDURE } 
    [schema_name.] procedure_name [ ; number ]   
    [ { @parameter [ type_schema_name. ] data_type }  
        [ VARYING ] [ = default ] [ OUT | OUTPUT | [READONLY]  
    ] [ ,...n ]   
[ WITH <procedure_option> [ ,...n ] ]  
[ FOR REPLICATION ]   
AS { [ BEGIN ] sql_statement [;] [ ...n ] [ END ] }  
[;]  
  
<procedure_option> ::=   
    [ ENCRYPTION ]  
    [ RECOMPILE ]  
    [ EXECUTE AS Clause ]  
```

**EXAMPLE**

1. Simple Transact-SQL Procedure
    ```sql 
    CREATE PROCEDURE HumanResources.uspGetAllEmployees  
    AS  
        SET NOCOUNT ON;  
        SELECT LastName, FirstName, JobTitle, Department  
        FROM HumanResources.vEmployeeDepartment;  
    GO  
    
    SELECT * FROM HumanResources.vEmployeeDepartment;  
    ```

2. Returning multiple sets
    ```sql
    CREATE PROCEDURE dbo.uspMultipleResults   
    AS  
    SELECT TOP(10) BusinessEntityID, Lastname, FirstName FROM Person.Person;  
    SELECT TOP(10) CustomerID, AccountNumber FROM Sales.Customer;  
    GO  
    ```

3. Procedures with input parameters
    ```sql
    IF OBJECT_ID ( 'HumanResources.uspGetEmployees', 'P' ) IS NOT NULL   
        DROP PROCEDURE HumanResources.uspGetEmployees;  
    GO  
    CREATE PROCEDURE HumanResources.uspGetEmployees   
        @LastName nvarchar(50),   
        @FirstName nvarchar(50)   
    AS   
    
        SET NOCOUNT ON;  
        SELECT FirstName, LastName, JobTitle, Department  
        FROM HumanResources.vEmployeeDepartment  
        WHERE FirstName = @FirstName AND LastName = @LastName;  
    GO  
    ```

4. Wildcard parameters
   ```sql
    IF OBJECT_ID ( 'HumanResources.uspGetEmployees2', 'P' ) IS NOT NULL   
        DROP PROCEDURE HumanResources.uspGetEmployees2;  
    GO  
    CREATE PROCEDURE HumanResources.uspGetEmployees2   
        @LastName nvarchar(50) = N'D%',   
        @FirstName nvarchar(50) = N'%'  
    AS   
        SET NOCOUNT ON;  
        SELECT FirstName, LastName, JobTitle, Department  
        FROM HumanResources.vEmployeeDepartment  
        WHERE FirstName LIKE @FirstName AND LastName LIKE @LastName;  
    ```

5. Output Parameters
    ```sql
    IF OBJECT_ID ( 'Production.uspGetList', 'P' ) IS NOT NULL   
        DROP PROCEDURE Production.uspGetList;  
    GO  
    CREATE PROCEDURE Production.uspGetList @Product varchar(40)   
        , @MaxPrice money   
        , @ComparePrice money OUTPUT  
        , @ListPrice money OUT  
    AS  
        SET NOCOUNT ON;  
        SELECT p.[Name] AS Product, p.ListPrice AS 'List Price'  
        FROM Production.Product AS p  
        JOIN Production.ProductSubcategory AS s   
        ON p.ProductSubcategoryID = s.ProductSubcategoryID  
        WHERE s.[Name] LIKE @Product AND p.ListPrice < @MaxPrice;  
    -- Populate the output variable @ListPprice.  
    SET @ListPrice = (SELECT MAX(p.ListPrice)  
            FROM Production.Product AS p  
            JOIN  Production.ProductSubcategory AS s   
            ON p.ProductSubcategoryID = s.ProductSubcategoryID  
            WHERE s.[Name] LIKE @Product AND p.ListPrice < @MaxPrice);  
    -- Populate the output variable @compareprice.  
    SET @ComparePrice = @MaxPrice;  
    GO  
    ````

### CREATE FUNCTION

**SYNTAX**

```
-- Transact-SQL Scalar Function Syntax  
CREATE [ OR ALTER ] FUNCTION [ schema_name. ] function_name   
( [ { @parameter_name [ AS ][ type_schema_name. ] parameter_data_type   
    [ = default ] [ READONLY ] }   
    [ ,...n ]  
  ]  
)  
RETURNS return_data_type  
    [ WITH <function_option> [ ,...n ] ]  
    [ AS ]  
    BEGIN   
        function_body   
        RETURN scalar_expression  
    END  
[ ; ]  
```

**EXAMPLE**

1. Scalar function
    ```sql
    CREATE FUNCTION dbo.ISOweek (@DATE datetime)  
    RETURNS int  
    WITH EXECUTE AS CALLER  
    AS  
    BEGIN  
        DECLARE @ISOweek int;  
        SET @ISOweek= DATEPART(wk,@DATE)+1  
            -DATEPART(wk,CAST(DATEPART(yy,@DATE) as CHAR(4))+'0104');  
    --Special cases: Jan 1-3 may belong to the previous year  
        IF (@ISOweek=0)   
            SET @ISOweek=dbo.ISOweek(CAST(DATEPART(yy,@DATE)-1   
                AS CHAR(4))+'12'+ CAST(24+DATEPART(DAY,@DATE) AS CHAR(2)))+1;  
    --Special case: Dec 29-31 may belong to the next year  
        IF ((DATEPART(mm,@DATE)=12) AND   
            ((DATEPART(dd,@DATE)-DATEPART(dw,@DATE))>= 28))  
            SET @ISOweek=1;  
        RETURN(@ISOweek);  
    END;  
    GO  
    SET DATEFIRST 1;  
    SELECT dbo.ISOweek(CONVERT(DATETIME,'12/26/2004',101)) AS 'ISO Week';
    ```

2. Inline table function
   ```sql
   CREATE FUNCTION Sales.ufn_SalesByStore (@storeid int)  
    RETURNS TABLE  
    AS  
    RETURN   
    (  
        SELECT P.ProductID, P.Name, SUM(SD.LineTotal) AS 'Total'  
        FROM Production.Product AS P   
        JOIN Sales.SalesOrderDetail AS SD ON SD.ProductID = P.ProductID  
        JOIN Sales.SalesOrderHeader AS SH ON SH.SalesOrderID = SD.SalesOrderID  
        JOIN Sales.Customer AS C ON SH.CustomerID = C.CustomerID  
        WHERE C.StoreID = @storeid  
        GROUP BY P.ProductID, P.Name  
    );  
    GO  
    ```
3. Table value function
   ```sql
   CREATE FUNCTION dbo.ufn_FindReports (@InEmpID INTEGER)  
    RETURNS @retFindReports TABLE   
    (  
        EmployeeID int primary key NOT NULL,  
        FirstName nvarchar(255) NOT NULL,  
        LastName nvarchar(255) NOT NULL,  
        JobTitle nvarchar(50) NOT NULL,  
        RecursionLevel int NOT NULL  
    )  
    --Returns a result set that lists all the employees who report to the   
    --specific employee directly or indirectly.*/  
    AS  
    BEGIN  
    WITH EMP_cte(EmployeeID, OrganizationNode, FirstName, LastName, JobTitle, RecursionLevel) -- CTE name and columns  
        AS (  
            -- Get the initial list of Employees for Manager n
            SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, 0   
            FROM HumanResources.Employee e   
    INNER JOIN Person.Person p   
    ON p.BusinessEntityID = e.BusinessEntityID  
            WHERE e.BusinessEntityID = @InEmpID  
            UNION ALL  
            -- Join recursive member to anchor
            SELECT e.BusinessEntityID, e.OrganizationNode, p.FirstName, p.LastName, e.JobTitle, RecursionLevel + 1   
            FROM HumanResources.Employee e   
                INNER JOIN EMP_cte  
                ON e.OrganizationNode.GetAncestor(1) = EMP_cte.OrganizationNode  
    INNER JOIN Person.Person p   
    ON p.BusinessEntityID = e.BusinessEntityID  
            )  
    -- copy the required columns to the result of the function   
    INSERT @retFindReports  
    SELECT EmployeeID, FirstName, LastName, JobTitle, RecursionLevel  
    FROM EMP_cte   
    RETURN  
    END;  
    GO  
    -- Example invocation  
    SELECT EmployeeID, FirstName, LastName, JobTitle, RecursionLevel  
    FROM dbo.ufn_FindReports(1);   
    
    GO  
    ```

### CREATE TRIGGER

**SYNTAX**
```
-- SQL Server Syntax  
-- Trigger on an INSERT, UPDATE, or DELETE statement to a table or view (DML Trigger)  
  
CREATE [ OR ALTER ] TRIGGER [ schema_name . ]trigger_name   
ON { table | view }   
[ WITH <dml_trigger_option> [ ,...n ] ]  
{ FOR | AFTER | INSTEAD OF }   
{ [ INSERT ] [ , ] [ UPDATE ] [ , ] [ DELETE ] }   
[ WITH APPEND ]  
[ NOT FOR REPLICATION ]   
AS { sql_statement  [ ; ] [ ,...n ] | EXTERNAL NAME <method specifier [ ; ] > }  
  
<dml_trigger_option> ::=  
    [ ENCRYPTION ]  
    [ EXECUTE AS Clause ]  
  
<method_specifier> ::=  
    assembly_name.class_name.method_name  
```

**EXAMPLE**
```sql
CREATE TRIGGER reminder2  
ON Sales.Customer  
AFTER INSERT, UPDATE, DELETE   
AS  
   EXEC msdb.dbo.sp_send_dbmail  
        @profile_name = 'AdventureWorks2012 Administrator',  
        @recipients = 'danw@Adventure-Works.com',  
        @body = 'Don''t forget to print a report for the sales force.',  
        @subject = 'Reminder';  
GO  
```

### CREATE VIEW

**SYNTAX**

```
-- Syntax for SQL Server and Azure SQL Database  
  
CREATE [ OR ALTER ] VIEW [ schema_name . ] view_name [ (column [ ,...n ] ) ]   
[ WITH <view_attribute> [ ,...n ] ]   
AS select_statement   
[ WITH CHECK OPTION ]   
[ ; ]  
  
<view_attribute> ::=   
{  
    [ ENCRYPTION ]  
    [ SCHEMABINDING ]  
    [ VIEW_METADATA ]       
}   
```

**EXAMPLE**


1. Simple View
   ```sql
   CREATE VIEW hiredate_view  
    AS   
    SELECT p.FirstName, p.LastName, e.BusinessEntityID, e.HireDate  
    FROM HumanResources.Employee e   
    JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID ;  
    GO  
    ```
2. Partitioned View (Union all)
    ```sql
    --Partitioned view as defined on Server1  
    CREATE VIEW Customers  
    AS  
    --Select from local member table.  
    SELECT *  
    FROM CompanyData.dbo.Customers_33  
    UNION ALL  
    --Select from member table on Server2.  
    SELECT *  
    FROM Server2.CompanyData.dbo.Customers_66  
    UNION ALL  
    --Select from member table on Server3.  
    SELECT *  
    FROM Server3.CompanyData.dbo.Customers_99; 
    ```
3. Encryption
   ```sql
   CREATE VIEW Purchasing.PurchaseOrderReject  
    WITH ENCRYPTION  
    AS  
    SELECT PurchaseOrderID, ReceivedQty, RejectedQty,   
        RejectedQty / ReceivedQty AS RejectRatio, DueDate  
    FROM Purchasing.PurchaseOrderDetail  
    WHERE RejectedQty / ReceivedQty > 0  
    AND DueDate > CONVERT(DATETIME,'20010630',101) ;  
    GO  
    ```