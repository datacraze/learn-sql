-- GRANT
GRANT SELECT ON sales TO ge_sql_X; -- choose 1 person

-- Ask that person to login and execut
-- SELECT * FROM <schema_name>.sales;
-- Example
SELECT * FROM ge_sql_1.sales;

-- Ups?

GRANT USAGE ON SCHEMA ge_sql_X TO ge_sql_Y;

-- Try Again? 

REVOKE SELECT ON sales TO ge_sql_X; -- choose 1 person
