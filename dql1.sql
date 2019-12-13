-- SELECT
SELECT * 
FROM sales;

-- alias?
select product_id as "Product ID", 
       sales_qty as "Sales Quantity" 
from sales;

-- WHERE
select *
from sales 
where sales_amount >5;

select count(id)
from sales 
where sales_amount >10;

-- UNION vs UNION ALL
CREATE TABLE supplier_systemA (
 supplier_name text,
 supplier_desc text
);

CREATE TABLE supplier_systemB (
 supplier_name text,
 supplier_desc text
);

INSERT INTO supplier_systemA (supplier_name, supplier_desc) VALUES ('Supplier 1', 'System 1');
INSERT INTO supplier_systemA (supplier_name, supplier_desc) VALUES ('Supplier 2', 'System 1');
INSERT INTO supplier_systemA (supplier_name, supplier_desc) VALUES ('Supplier 3', 'System 1');
INSERT INTO supplier_systemB (supplier_name, supplier_desc) VALUES ('Supplier 1', 'System 2');
INSERT INTO supplier_systemB (supplier_name, supplier_desc) VALUES ('Supplier 4', 'System 2');
INSERT INTO supplier_systemB (supplier_name, supplier_desc) VALUES ('Supplier 9', 'System 2');

SELECT supplier_name
FROM supplier_systemA
UNION
SELECT supplier_name
FROM supplier_systemB;

SELECT supplier_name
FROM supplier_systemA
UNION ALL
SELECT supplier_name
FROM supplier_systemB;

-- LIMIT & OFFSET
select *
from sales 
Limit 5
offset 5;

-- WTF? IS WRONG WITH OFFSET
-- "Loosing" rows .. during insert and read

-- GROUP BY 
select sum(sales_amount)
from sales ;

-- UPS?
select sales_qty, sum(sales_amount)
from sales ;

-- https://www.postgresql.org/docs/9.5/functions-aggregate.html

-- WHAT IS WRONG HERE?
select extract(year from sales_date)||extract(month from sales_date),
       sum(sales_amount)
from sales 
group by extract(year from sales_date)||extract(month from sales_date);

-- FIX
select extract(year from sales_date)||''||extract(month from sales_date), sum(sales_amount)
from sales 
group by extract(year from sales_date)||''||extract(month from sales_date);

-- HAVING
select extract(year from sales_date)||''||extract(month from sales_date), sum(sales_amount)
from sales 
group by extract(year from sales_date)||''||extract(month from sales_date)
having sum(sales_amount) > 10000;

