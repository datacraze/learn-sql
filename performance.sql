-- TRUNCATE TABLE products
CREATE TABLE products_performance (
	id serial,
    product_id varchar(100),
	product_name varchar(500),
	product_category varchar(250)
);


insert into products_performance (product_id, product_name, product_category)
select
    left(md5(i::text), 10),
    md5(random()::text),
    md5(random()::text)
from generate_series(1, 1000000) s(i);

select count(*) from products_performance;

select * from products_performance limit 1;

EXPLAIN ANALYZE 
SELECT * FROM products_performance WHERE product_id = 'c4ca4238a0'; -- GET ONE example from data

DISCARD PLANS;

CREATE INDEX product_id_products_idx ON products_performance USING btree(product_id);

EXPLAIN ANALYZE 
SELECT * FROM products_performance WHERE product_id = 'c4ca4238a0';
