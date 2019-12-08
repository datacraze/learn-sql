-- DUPLICATES
select product_name 
from products 
order by product_name;

-- remove duplicates?
select distinct product_name 
from products 
order by product_name;

select product_name from (
select product_name, row_number() over(partition by product_name) rc
from products) sq
where rc = 1;


-- check how per attribute
select product_name, count(*) 
from products
group by product_name 
order by product_name;

-- check how many duplicates only
select product_name, count(*) 
from products
group by product_name 
having count(*) >  1
order by product_name;