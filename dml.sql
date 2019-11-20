-- INSERT 
INSERT INTO products (product_id, product_name, product_category) VALUES ('101', 'Product 1', 'Category 1');
INSERT INTO products (product_id, product_name, product_category) VALUES ('102', 'Product 1', 'Category 2');
INSERT INTO products (product_id, product_name, product_category) VALUES ('103', 'Product 1', 'Category 3');
INSERT INTO products (product_id, product_name, product_category) VALUES ('104', 'Product 2', 'Category 1');
INSERT INTO products (product_id, product_name, product_category) VALUES ('105', 'Product 3', 'Category 2');
INSERT INTO products (product_id, product_name, product_category) VALUES ('999', 'Product 999', 'Category 999');

-- UPDATE

UPDATE products SET product_name = 'Product 4';

-- Ups? 

-- DELETE 
DELETE FROM products;

-- Ups or Not?

-- INSERT AGAIN

UPDATE products SET product_name = 'Product 4' WHERE product_name = 'Product 3';

--- DELETE 

DELETE FROM products WHERE product_id = 999::varchar;

-- ADD SOME DATA
TRUNCATE TABLE products CASCADE RESTART IDENTITY;
ALTER TABLE products ADD COLUMN random_desc TEXT;

CREATE TEMP SEQUENCE products_insert MINVALUE 0 START WITH 0;

INSERT INTO products (product_id, product_name, product_category, random_desc)
select '10'||nextval('products_insert')::TEXT,
        'Product '||floor(random() * 10 + 1)::int,
        'Category '||floor(random() * 10 + 1)::int,
        left(md5(i::text), 15)
   from generate_series(1, 100) s(i);
   
TRUNCATE TABLE sales CASCADE RESTART IDENTITY;
ALTER TABLE sales ADD COLUMN sales_qty INTEGER;
   
INSERT INTO sales (sales_date, sales_amount, sales_qty, products_id)
 select NOW() + (random() * (interval '90 days')) + '30 days',
        random() * 10 + 1,
        floor(random() * 10 + 1)::int,
        floor(random() * 100 + 1)::int
   from generate_series(1, 10000) s(i);