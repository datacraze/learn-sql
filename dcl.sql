-- GRANT
GRANT SELECT ON sales TO learn_sql_X; -- choose 1 person

-- Ask that person to login and execut
-- SELECT * FROM <schema_name>.sales;
-- Example
SELECT * FROM learn_sql_X.sales;

-- Ups?
GRANT USAGE ON SCHEMA learn_sql_X TO learn_sql_Y;
GRANT SELECT ON sales TO learn_sql_X; -- choose 1 person

-- Try Again? 
REVOKE SELECT ON sales FROM learn_sql_X; -- choose 1 person