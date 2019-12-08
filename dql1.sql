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

