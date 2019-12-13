-- INSERT 
INSERT INTO products (product_id, product_name, product_category) VALUES ('101', 'Product 1', 'Category 1');
INSERT INTO products (product_id, product_name, product_category) VALUES ('102', 'Product 1', 'Category 2');
INSERT INTO products (product_id, product_name, product_category) VALUES ('103', 'Product 1', 'Category 3');
INSERT INTO products (product_id, product_name, product_category) VALUES ('104', 'Product 2', 'Category 1');
INSERT INTO products (product_id, product_name, product_category) VALUES ('105', 'Product 3', 'Category 2');
INSERT INTO products (product_id, product_name, product_category) VALUES ('999', 'Product 999', 'Category 999');

-- WHAT HAPPEND ?

-- REMEMBER ABOUT TRANSACTIONS (COMMIT / ROLLBACK)
ALTER TABLE products DROP CONSTRAINT unq_product_name;

-- UPDATE

UPDATE products SET product_name = 'Product 4';

-- Ups? 
select * from products;

-- DELETE 
DELETE FROM products;

-- Ups or Not?

-- INSERT AGAIN

UPDATE products SET product_name = 'Product 4' WHERE product_name = 'Product 3';

--- DELETE 

DELETE FROM products WHERE product_id = 999::varchar;

-- ADD SOME DATA
TRUNCATE TABLE products RESTART IDENTITY CASCADE;
ALTER TABLE products ADD COLUMN random_desc TEXT;

DROP SEQUENCE IF EXISTS products_insert;
CREATE TEMP SEQUENCE products_insert MINVALUE 0 START WITH 0;

INSERT INTO products (product_id, product_name, product_category, random_desc)
select nextval('products_insert')::TEXT,
        'Product '||floor(random() * 10 + 1)::int,
        'Category '||floor(random() * 10 + 1)::int,
        left(md5(i::text), 15)
   from generate_series(1, 100) s(i);
   
TRUNCATE TABLE sales RESTART IDENTITY CASCADE;

INSERT INTO sales (sales_date, sales_amount, sales_qty, product_id)
 select NOW() + (random() * (interval '90 days')) + '30 days',
        random() * 10 + 1,
        floor(random() * 10 + 1)::int,
        floor(random() * 100)::int
   from generate_series(1, 10000) s(i);


--- LOCKING

-- CHANGE AUTCOMMIT IN OPTIONS TO FALSE
CREATE TABLE test_locking (id int); 
-- NOW THIS
INSERT INTO test_locking (id) values(5);
BEGIN;
TRUNCATE TABLE test_locking;

-- SECOND WINDOW
SELECT * FROM test_locking;

-- CHECK THIS
COMMIT;

-- CLEANUP
DROP TABLE test_locking;

-- TURN ON AUTOCMMIT