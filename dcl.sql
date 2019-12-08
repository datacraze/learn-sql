-- GRANT
GRANT SELECT ON sales TO ge_sql_X; -- choose 1 person

-- Ask that person to login and execut
-- SELECT * FROM <schema_name>.sales;
-- Example
SELECT * FROM ge_sql_X.sales;

-- Ups?
GRANT USAGE ON SCHEMA ge_sql_X TO ge_sql_Y;
GRANT SELECT ON sales TO ge_sql_X; -- choose 1 person

-- Try Again? 

REVOKE SELECT ON sales FROM ge_sql_X; -- choose 1 person
