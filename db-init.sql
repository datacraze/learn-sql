DO $atw$
DECLARE
    counter INTEGER :=0;
    users text[] := '{ge_sql_1, ge_sql_2, ge_sql_3, ge_sql_4, ge_sql_5, ge_sql_6, ge_sql_7, ge_sql_8, ge_sql_9, ge_sql_10}';
    object_tc TEXT;
    db_name TEXT := 'trainings';
 BEGIN
    LOOP 
      EXIT WHEN counter = 10 ; 
      counter := counter + 1 ; 

      object_tc := users[counter];
     
      IF NOT EXISTS (
        SELECT 1
        FROM   pg_catalog.pg_user
        WHERE  usename = object_tc) THEN

        EXECUTE 'CREATE USER '|| object_tc || ' WITH LOGIN PASSWORD ''' || object_tc || '''  NOSUPERUSER INHERIT NOREPLICATION';
		EXECUTE 'CREATE SCHEMA IF NOT EXISTS ' || object_tc;
           
        END IF;
       
        EXECUTE 'REVOKE CONNECT ON DATABASE ' || db_name || ' FROM ' || object_tc;
        EXECUTE 'REVOKE ALL PRIVILEGES ON DATABASE ' || db_name || ' FROM ' || object_tc;
        EXECUTE 'GRANT USAGE ON SCHEMA ' || object_tc || ' TO ' || object_tc;
        EXECUTE 'GRANT ALL PRIVILEGES ON SCHEMA ' || object_tc || ' TO ' || object_tc;

    END LOOP ; 

  END;
$atw$ LANGUAGE plpgsql;