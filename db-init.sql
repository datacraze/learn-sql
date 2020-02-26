DO $atw$
DECLARE
    counter INTEGER :=0;
    object_tc TEXT;
    db_name TEXT := 'trainings';
 BEGIN
    LOOP 
      EXIT WHEN counter = 50 ; 
      object_tc := 'learn_sql_'||counter;
      counter := counter + 1 ;
	  
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

-- CHANGE DEFAULT PASSWORD
--ALTER USER user_name WITH PASSWORD 'new_password';