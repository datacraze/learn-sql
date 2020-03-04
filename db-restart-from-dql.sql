SET search_path TO <YOUR USER HERE>;

DO $$ DECLARE
    r RECORD;
BEGIN
    FOR r IN (SELECT tablename FROM pg_tables WHERE schemaname = current_schema()) LOOP
        EXECUTE 'DROP TABLE IF EXISTS ' || quote_ident(r.tablename) || ' CASCADE';
    END LOOP;
END $$;

CREATE TABLE IF NOT EXISTS sales (
    id SERIAL,
    sales_date TIMESTAMP,
    sales_amount NUMERIC(38,2),
    sales_qty INTEGER,
    discount NUMERIC(38,2),
	product_id varchar(100)
);

CREATE TABLE IF NOT EXISTS products (
	id serial,
	product_id varchar(100),
	product_name varchar(500),
	product_category varchar(250),
	random_desc text
);

ALTER TABLE products ADD PRIMARY KEY (product_id);
ALTER TABLE sales ADD FOREIGN KEY (product_id) REFERENCES products(product_id);

DROP SEQUENCE IF EXISTS products_insert;
CREATE TEMP SEQUENCE products_insert MINVALUE 0 START WITH 0;

INSERT INTO products (product_id, product_name, product_category, random_desc)
select nextval('products_insert')::TEXT,
        'Product '||floor(random() * 10 + 1)::int,
        'Category '||floor(random() * 10 + 1)::int,
        left(md5(i::text), 15)
   from generate_series(1, 100) s(i);

INSERT INTO sales (sales_date, sales_amount, sales_qty, product_id)
 select NOW() + (random() * (interval '90 days')) + '30 days',
        random() * 10 + 1,
        floor(random() * 10 + 1)::int,
        floor(random() * 100)::int
   from generate_series(1, 10000) s(i);
   