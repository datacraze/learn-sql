-- DATA TYPES DO THEY MATTER
CREATE TABLE data_types_check_text (
    product_name text
);

INSERT INTO data_types_check_text (product_name)
select 'Product '||floor(random() * 10 + 1)::int
  from generate_series(1, 1000000) s(i);


CREATE TABLE data_types_check_10 (
    product_name varchar(10)
);

INSERT INTO data_types_check_10 (product_name)
select 'Product '||floor(random() * 10 + 1)::int
  from generate_series(1, 1000000) s(i);

-- SELECT pg_size_pretty( pg_database_size('dbname'));
-- SELECT pg_size_pretty( pg_table_size('schema.table'));

CREATE INDEX product_name_text ON data_types_check_text USING btree(product_name);
CREATE INDEX product_name_10 ON data_types_check_10 USING btree(product_name);

-- PRONS OR CONS
insert into data_types_check_10 (product_name) values ('Product 111');

-- TRSUT BUT VALIDATE :D 