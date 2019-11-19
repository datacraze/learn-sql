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

