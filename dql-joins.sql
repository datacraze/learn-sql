-- http://www.postgresqltutorial.com/postgresql-joins/
-- EXAMPLE

CREATE TABLE basket_a (
    id INT PRIMARY KEY,
    fruit VARCHAR (100) NOT NULL
);
 
CREATE TABLE basket_b (
    id INT PRIMARY KEY,
    fruit VARCHAR (100) NOT NULL
);
 
INSERT INTO basket_a (id, fruit)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');
 
INSERT INTO basket_b (id, fruit)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');


-- INNER JOIN
SELECT
    a.id id_a,
    a.fruit fruit_a,
    b.id id_b,
    b.fruit fruit_b
FROM
    basket_a a
INNER JOIN basket_b b ON a.fruit = b.fruit;

-- LEFT JOIN
SELECT
    a.id id_a,
    a.fruit fruit_a,
    b.id id_b,
    b.fruit fruit_b
FROM
    basket_a a
LEFT JOIN basket_b b ON a.fruit = b.fruit;

-- RIGHT JOIN
SELECT
    a.id id_a,
    a.fruit fruit_a,
    b.id id_b,
    b.fruit fruit_b
FROM
    basket_a a
RIGHT JOIN basket_b b ON a.fruit = b.fruit;

-- FULL JOIN
SELECT
    a.id id_a,
    a.fruit fruit_a,
    b.id id_b,
    b.fruit fruit_b
FROM
    basket_a a
FULL OUTER JOIN basket_b b ON a.fruit = b.fruit;

-- WHAT ABOUT CROSS JOIN?
select * from basket_a, basket_b;

-- SELF JOIN 
http://www.postgresqltutorial.com/postgresql-self-join/


------ OUR DATA

insert into products (product_id, product_name, product_category)
values ('-999','TEST JOIN PRODUCT','TEST CATEGORY');
-- INNER JOIN
select s.id, s.sales_date, s.sales_amount, s.sales_qty,
       p.product_name, p.product_category, p.product_id
from sales s 
inner join products p on p.product_id = s.product_id
order by p.product_name;


-- RIGHT JOIN
select *
from sales s
right join products p on p.product_id = s.product_id 
where s.id is null