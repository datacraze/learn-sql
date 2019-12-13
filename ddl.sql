-- MAKES OUR LIFE EASIER
SET search_path TO learn_sql_X; -- YOUR USER HERE

-- CREATE TABLE
CREATE TABLE sales (
    id SERIAL,
    sales_date TIMESTAMP,
    sales_amount NUMERIC(38,2)
);

-- AGAIN WITH NEW FIELDS?
CREATE TABLE sales (
    id SERIAL,
    sales_date TIMESTAMP,
    sales_amount NUMERIC(38,2),
    sales_qty INTEGER
);

-- UPS? HOW TO DEAL WITH THAT?
-- 1
ALTER TABLE sales ADD COLUMN sales_qty INTEGER;
-- 2
DROP TABLE sales;
-- 3 -- BEWARE NEW COLUMN ADDED
CREATE TABLE IF NOT EXISTS sales (
    id SERIAL,
    sales_date TIMESTAMP,
    sales_amount NUMERIC(38,2),
    sales_qty INTEGER,
    discount NUMERIC(38,2)
);

-- LET's CREATE NEW TABLE
CREATE TABLE products (
	product_id varchar(100),
	product_name varchar(500),
	product_category varchar(250)
);

------------------ CASCADE
CREATE OR REPLACE VIEW sales_year2019 AS (
    SELECT sales_date,
           sales_amount,
           sales_qty
      FROM sales
     WHERE date_part('year', sales_date) = 2019
);

DROP TABLE sales;

-- NO NO NO :) 

DROP TABLE sales CASCADE;
SELECT * FROM sales_year2019; -- ?

-- RECREATE SALES TABLE
CREATE TABLE IF NOT EXISTS sales (
    id SERIAL,
    sales_date TIMESTAMP,
    sales_amount NUMERIC(38,2),
    sales_qty INTEGER,
    discount NUMERIC(38,2)
);

-- CONSTRAINTS

ALTER TABLE products ADD PRIMARY KEY (product_id);

ALTER TABLE sales ADD COLUMN product_id varchar(100);

ALTER TABLE sales ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE products ADD COLUMN id SERIAL;


-- UNIQUE CONSTRAINTS
ALTER TABLE products ADD CONSTRAINT unq_product_name UNIQUE(product_name);


CREATE TABLE customers (
    ID SERIAL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);


-- SHOULD WE USE CONSTRAINTS, TO WHAT EXTENT? 