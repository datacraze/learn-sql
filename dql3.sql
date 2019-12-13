
-- WINDOW FUNCTION 
CREATE TABLE scores (
  id serial,
  name varchar(255),
  score int,
  age_category int
);

INSERT INTO scores VALUES (1, 'Bartosz', 100,1);
INSERT INTO scores VALUES (2, 'Tomasz', 10,1);
INSERT INTO scores VALUES (3, 'Krzysztof', 92,2);
INSERT INTO scores VALUES (4, 'Anna', 61,1);
INSERT INTO scores VALUES (5, 'Zofia', 22,2);
INSERT INTO scores VALUES (6, 'Monika', 42,1);
INSERT INTO scores VALUES (7, 'Konrad', 26,1);
INSERT INTO scores VALUES (8, 'Grzegorz', 72,3);
INSERT INTO scores VALUES (9, 'Wojciech', 43,3);
INSERT INTO scores VALUES (10, 'Dominika', 92,2);

select name,
       age_category,
       score,
       dense_rank() over (partition by age_category order by score desc) as position
  from scores
 order by age_category

 -- RANK VS DENSE_RANK ?

-- total sum
select product_name, year_month, sum(sales_amount) as total_sales, sum(sales_qty) as total_qty
from (select product_name, sales_amount, sales_qty, 
       extract(year from sales_date)||''||extract(month from sales_date) as year_month from sales s
    left join products p on p.product_id = s.product_id) sq
group by product_name, year_month
order by product_name, year_month;

-- rolling sum
select distinct product_name, year_month, 
sum(sales_amount) over (partition by product_name order by year_month) as total_sales, 
sum(sales_qty) over (partition by product_name order by year_month) as total_qty
from (select product_name, sales_amount, sales_qty, 
       extract(year from sales_date)||''||extract(month from sales_date) as year_month from sales s
    left join products p on p.product_id = s.product_id) sq
order by product_name, year_month;